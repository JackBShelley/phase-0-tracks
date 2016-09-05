##html status codes
* 200 OK, the request succeeded
* 300 multiple choices, the request has multiple choices and cannot choose one
* 301 Moved permanently
* 302 Found
* 304 not modified,the client has performed a conditional GET request and access is allowed, but the document has not been modified
* 307 temporary redirect, the requested resource resides temporarily under a different URI
* 400 Bad Request
* 401 Unauthorized, request requires authentication
* 403 Forbidden, the server understood the request, but is refusing to fulfill it 
* 404 Not found
* 410 Gone the requested resource is no longer available at the server and no forwarding address is known
* 500 Internal Server Error
* 501 Not implemented, the server does not support the functionality required to fulfill the request
* 503 Service Unavailable 
* 550 Permission Denied, the server is stating the account you have currently logged in as does not have permission to perform the action you are attempting

##GET vs POST
GET: Requests data from a specified resource

* Can't be bookmarked
* Can be cached
* Only ASCII characters
* Typically use for an action which does not change the data 
requested


POST: Submits data to be processed to a specified resource

* Can't be bookmarked 
* Can't be cached
* No restriction on data type
* Safer then GET for sensitive data
* Can transfer significantly more data

##Cookies
Cookies seem to just be a way of differentiating between users. It is stored in the http header called Cookie

Syntax:

    Set-Cookie: <em>value</em>[; expires=<em>date</em>][; domain=<em>domain</em>][; path=<em>path</em>][; secure]