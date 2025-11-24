from django import forms

class ProfessionalForm(forms.Form):
    name = forms.CharField(max_length=255)
    phone = forms.CharField(max_length=50)
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput())
    description = forms.CharField(widget=forms.Textarea, required=False)
    cep = forms.CharField(max_length=100)
    address = forms.CharField(max_length=100)
    city_state = forms.CharField(max_length=100)
    latitude = forms.CharField(max_length=100)
    longitude = forms.CharField(max_length=100)
    category_id = forms.ChoiceField(choices=[])  # será preenchido dinamicamente
    schedule = forms.CharField(max_length=255)
    image = forms.FileField(required=False)
