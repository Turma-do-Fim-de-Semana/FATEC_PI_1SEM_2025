// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRoomsForClientHash() =>
    r'094ec3329c171a9f6cdce65994f9309f098a2df5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [chatRoomsForClient].
@ProviderFor(chatRoomsForClient)
const chatRoomsForClientProvider = ChatRoomsForClientFamily();

/// See also [chatRoomsForClient].
class ChatRoomsForClientFamily extends Family<AsyncValue<List<ChatRoomModel>>> {
  /// See also [chatRoomsForClient].
  const ChatRoomsForClientFamily();

  /// See also [chatRoomsForClient].
  ChatRoomsForClientProvider call(String clientId) {
    return ChatRoomsForClientProvider(clientId);
  }

  @override
  ChatRoomsForClientProvider getProviderOverride(
    covariant ChatRoomsForClientProvider provider,
  ) {
    return call(provider.clientId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatRoomsForClientProvider';
}

/// See also [chatRoomsForClient].
class ChatRoomsForClientProvider
    extends AutoDisposeFutureProvider<List<ChatRoomModel>> {
  /// See also [chatRoomsForClient].
  ChatRoomsForClientProvider(String clientId)
    : this._internal(
        (ref) => chatRoomsForClient(ref as ChatRoomsForClientRef, clientId),
        from: chatRoomsForClientProvider,
        name: r'chatRoomsForClientProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$chatRoomsForClientHash,
        dependencies: ChatRoomsForClientFamily._dependencies,
        allTransitiveDependencies:
            ChatRoomsForClientFamily._allTransitiveDependencies,
        clientId: clientId,
      );

  ChatRoomsForClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clientId,
  }) : super.internal();

  final String clientId;

  @override
  Override overrideWith(
    FutureOr<List<ChatRoomModel>> Function(ChatRoomsForClientRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatRoomsForClientProvider._internal(
        (ref) => create(ref as ChatRoomsForClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clientId: clientId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ChatRoomModel>> createElement() {
    return _ChatRoomsForClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRoomsForClientProvider && other.clientId == clientId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clientId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatRoomsForClientRef
    on AutoDisposeFutureProviderRef<List<ChatRoomModel>> {
  /// The parameter `clientId` of this provider.
  String get clientId;
}

class _ChatRoomsForClientProviderElement
    extends AutoDisposeFutureProviderElement<List<ChatRoomModel>>
    with ChatRoomsForClientRef {
  _ChatRoomsForClientProviderElement(super.provider);

  @override
  String get clientId => (origin as ChatRoomsForClientProvider).clientId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
