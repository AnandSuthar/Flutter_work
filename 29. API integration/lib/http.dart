import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'network.dart';
import 'package:flutter/foundation.dart' as Foundation;

const _timeoutDuration = Duration(seconds: 5);

const Map<int, String> _statusCodes = {
200: "OK",
201: "Created",
202: "Accepted",
203: "Non-Authoritative Information",
204: "No Content",
205: "Reset Content",
206: "Partial Content",
207: "Multi-Status (WebDAV)",
208: "Already Reported (WebDAV)",
226: "IM Used (HTTP Delta encoding)",
300: "Multiple Choice",
301: "Moved Permanently",
302: "Found",
303: "See Other",
304: "Not Modified",
305: "Use Proxy",
306: "unused",
307: "Temporary Redirect",
308: "Permanent Redirect",
400: "Bad Request",
401: "Unauthorized",
402: "Payment Required",
403: "Forbidden",
404: "Not Found",
405: "Method Not Allowed",
406: "Not Acceptable",
407: "Proxy Authentication Required",
408: "Request Timeout",
409: "Conflict",
410: "Gone",
411: "Length Required",
412: "Precondition Failed",
413: "Payload Too Large",
414: "URI Too Long",
415: "Unsupported Media Type",
416: "Range Not Satisfiable",
417: "Expectation Failed",
418: "I'm a teapot",
421: "Misdirected Request",
422: "Unprocessable Entity (WebDAV)",
423: "Locked (WebDAV)",
424: "Failed Dependency (WebDAV)",
425: "Too Early",
426: "Upgrade Required",
428: "Precondition Required",
429: "Too Many Requests",
431: "Request Header Fields Too Large",
451: "Unavailable For Legal Reasons",
500: "Internal Server Error",
501: "Not Implemented",
502: "Bad Gateway",
503: "Service Unavailable",
504: "Gateway Timeout",
505: "HTTP Version Not Supported",
506: "Variant Also Negotiates",
507: "Insufficient Storage (WebDAV)",
508: "Loop Detected (WebDAV)",
510: "Not Extended",
511: "Network Authentication Required",
};

class HTTP {


  static Future<dynamic> get({@required String api}) async {

    if(Network.status == NetworkState.DISCONNECTED || Network.status == NetworkState.UNKNOWN) {
      throw "No network available";
    }

    try {

      Response response = await http.get(api).timeout(_timeoutDuration);
      if(response.statusCode == HttpStatus.ok) {
        return convert.jsonDecode(response.body);
      } else {
        final message = (Foundation.kDebugMode) ? "${response.statusCode}: ${_statusCodes[response.statusCode]}" : null; // Need to throw only for text and debug mode, for release mode need to change messages to something else
        throw message;
      }

    } on TimeoutException catch(_) {
      throw "Unable to connect to the server";
    } catch (error) {
      throw error.toString();
    }


  }

  static Future<HttpResponse> post({@required String api, dynamic body }) async {

    if(Network.status == NetworkState.DISCONNECTED || Network.status == NetworkState.UNKNOWN) {
      throw "No network available";
    }

    try {

      // header need to be implemented here
      Response response = await http.post(api,headers: null, body: body).timeout(_timeoutDuration);
      if(response.statusCode == HttpStatus.ok) {
        return convert.jsonDecode(response.body);
      } else {
        final message = (Foundation.kDebugMode) ? "${response.statusCode}: ${_statusCodes[response.statusCode]}" : null; // Need to throw only for text and debug mode, for release mode need to change messages to something else
        throw message;
      }

    } on TimeoutException catch(_) {
      throw "Unable to connect to the server";
    } catch (error) {
      throw error.toString();
    }

  }



}




