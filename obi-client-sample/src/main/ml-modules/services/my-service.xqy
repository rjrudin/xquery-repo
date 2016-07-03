xquery version "1.0-ml";

module namespace resource = "http://marklogic.com/rest-api/resource/my-service";

import module namespace sample = "urn:obi-client-sample:sample" at "/ext/obi-client-sample/sample-lib.xqy";

declare function get(
  $context as map:map,
  $params  as map:map
  ) as document-node()*
{
  xdmp:log("GET called"),
  document{
    sample:echo(map:get($params, "text"))
  }
};

declare function put(
  $context as map:map,
  $params  as map:map,
  $input   as document-node()*
  ) as document-node()?
{
  xdmp:log("PUT called")
};

declare function post(
  $context as map:map,
  $params  as map:map,
  $input   as document-node()*
  ) as document-node()*
{
  xdmp:log("POST called")
};

declare function delete(
  $context as map:map,
  $params  as map:map
  ) as document-node()?
{
  xdmp:log("DELETE called")
};
