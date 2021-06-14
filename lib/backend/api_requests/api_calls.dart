import 'api_manager.dart';

Future<dynamic> flutterFlowApiCall() => ApiManager.instance.makeApiCall(
      callName: 'flutterFlowApi',
      apiDomain: '60c78b28afc88600179f5586.mockapi.io',
      apiEndpoint: 'api/v1/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );
