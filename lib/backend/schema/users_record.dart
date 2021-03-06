import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'profile_pic_url')
  String get profilePicUrl;

  @nullable
  String get bio;

  @nullable
  String get website;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..username = ''
    ..displayName = ''
    ..profilePicUrl = ''
    ..bio = ''
    ..website = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String username,
  String displayName,
  String profilePicUrl,
  String bio,
  String website,
  DateTime createdTime,
  String photoUrl,
  String uid,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..username = username
          ..displayName = displayName
          ..profilePicUrl = profilePicUrl
          ..bio = bio
          ..website = website
          ..createdTime = createdTime
          ..photoUrl = photoUrl
          ..uid = uid
          ..phoneNumber = phoneNumber));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..email = dummyString
    ..username = dummyString
    ..displayName = dummyString
    ..profilePicUrl = dummyImagePath
    ..bio = dummyString
    ..website = dummyString
    ..createdTime = dummyTimestamp
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..phoneNumber = dummyString;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
