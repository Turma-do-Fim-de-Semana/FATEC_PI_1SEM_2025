// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesByRoomHash() => r'b8a9e38ce436c874e28fedd1df0454667f90830e';

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

/// See also [messagesByRoom].
@ProviderFor(messagesByRoom)
const messagesByRoomProvider = MessagesByRoomFamily();

/// See also [messagesByRoom].
class MessagesByRoomFamily extends Family<AsyncValue<List<MessageModel>>> {
  /// See also [messagesByRoom].
  const MessagesByRoomFamily();

  /// See also [messagesByRoom].
  MessagesByRoomProvider call(String chatRoomId) {
    return MessagesByRoomProvider(chatRoomId);
  }

  @override
  MessagesByRoomProvider getProviderOverride(
    covariant MessagesByRoomProvider provider,
  ) {
    return call(provider.chatRoomId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagesByRoomProvider';
}

/// See also [messagesByRoom].
class MessagesByRoomProvider
    extends AutoDisposeFutureProvider<List<MessageModel>> {
  /// See also [messagesByRoom].
  MessagesByRoomProvider(String chatRoomId)
    : this._internal(
        (ref) => messagesByRoom(ref as MessagesByRoomRef, chatRoomId),
        from: messagesByRoomProvider,
        name: r'messagesByRoomProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$messagesByRoomHash,
        dependencies: MessagesByRoomFamily._dependencies,
        allTransitiveDependencies:
            MessagesByRoomFamily._allTransitiveDependencies,
        chatRoomId: chatRoomId,
      );

  MessagesByRoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatRoomId,
  }) : super.internal();

  final String chatRoomId;

  @override
  Override overrideWith(
    FutureOr<List<MessageModel>> Function(MessagesByRoomRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessagesByRoomProvider._internal(
        (ref) => create(ref as MessagesByRoomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatRoomId: chatRoomId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MessageModel>> createElement() {
    return _MessagesByRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesByRoomProvider && other.chatRoomId == chatRoomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRoomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MessagesByRoomRef on AutoDisposeFutureProviderRef<List<MessageModel>> {
  /// The parameter `chatRoomId` of this provider.
  String get chatRoomId;
}

class _MessagesByRoomProviderElement
    extends AutoDisposeFutureProviderElement<List<MessageModel>>
    with MessagesByRoomRef {
  _MessagesByRoomProviderElement(super.provider);

  @override
  String get chatRoomId => (origin as MessagesByRoomProvider).chatRoomId;
}

String _$messageViewModelHash() => r'9e7ca8b02ec967e756f37b0772a9e60a7749b1d5';

/// See also [messageViewModel].
@ProviderFor(messageViewModel)
final messageViewModelProvider = AutoDisposeProvider<MessageViewModel>.internal(
  messageViewModel,
  name: r'messageViewModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$messageViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MessageViewModelRef = AutoDisposeProviderRef<MessageViewModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
