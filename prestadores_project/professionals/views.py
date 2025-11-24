from django.shortcuts import render, redirect
from .forms import ProfessionalForm
from .supabase_client import supabase
import uuid

def landing(request):
    """Página inicial (landing page)"""
    return render(request, "landing/index.html")


def cadastrar_profissional(request):
    categories = supabase.table("category").select("*").execute().data
    category_choices = [(c["id_category"], c["description"]) for c in categories]

    if request.method == "POST":
        form = ProfessionalForm(request.POST, request.FILES)
        form.fields["category_id"].choices = category_choices

        if form.is_valid():
            data = form.cleaned_data

            image_url = None
            file = request.FILES.get("image")
            if file:
                filename = f"{uuid.uuid4()}_{file.name}"
                bucket = supabase.storage.from_("professionals")
                bucket.upload(filename, file.read(), file_options={"content-type": file.content_type})
                image_url = bucket.get_public_url(filename)

            payload = {
                "name": data["name"],
                "phone": data["phone"],
                "email": data["email"],
                "password": data["password"],
                "description": data["description"],
                "cep": data["cep"],
                "address": data["address"],
                "city_state": data["city_state"],
                "latitude": data["latitude"],
                "longitude": data["longitude"],
                "image": image_url,
                "category_id": data["category_id"],
                "schedule": data["schedule"],
                "is_provider": True,
            }

            supabase.table("professional").insert(payload).execute()
            return redirect("sucesso")

    else:
        form = ProfessionalForm()
        form.fields["category_id"].choices = category_choices

    return render(request, "forms_page/cadastrar_profissional.html", {"form": form})


def sucesso(request):
    return render(request, "forms_page/sucesso.html")
