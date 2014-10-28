xquery version "1.0-ml";

module namespace pretty-config = "http://marklogic.com/rest-api/resource/pretty-config";

import module namespace eput = "http://marklogic.com/rest-api/lib/endpoint-util" at "/MarkLogic/rest-api/lib/endpoint-util.xqy";

declare namespace rapi  = "http://marklogic.com/rest-api";

declare function get(
  $context as map:map,
  $params  as map:map
  ) as document-node()*
{
  let $transform := (map:get($params, "transform"), "pretty-config-transform")[1]
  
  let $options := xdmp:eval(
    fn:concat(
      'xquery version "1.0-ml"; ',
      'import module namespace config-query = "http://marklogic.com/rest-api/models/config-query" at "/MarkLogic/rest-api/models/config-query-model.xqy"; ',
      'config-query:get-list(map:map(), map:map())'
    )
  )
  
  let $resources := xdmp:eval(
  	fn:concat(
  		'xquery version "1.0-ml"; ',
  		'import module namespace rsrcmodqry = "http://marklogic.com/rest-api/models/resource-model-query" at "/MarkLogic/rest-api/models/resource-model-query.xqy"; ',
  		'rsrcmodqry:list-sources("xml", ())'
  	)
  )
  
  let $transforms := xdmp:eval(
    fn:concat(
      'xquery version "1.0-ml"; ',
      'import module namespace tformod = "http://marklogic.com/rest-api/models/transform-model" at "/MarkLogic/rest-api/models/transform-model.xqy"; ',
      'tformod:get-list(map:map(), map:map(), ())'
    )
  )
    
  return eput:apply-document-transform($transform, $params, $context, 
    document {
      element rapi:Config {
        $resources,
        $options,
        $transforms
      } 
    }
  )
};
