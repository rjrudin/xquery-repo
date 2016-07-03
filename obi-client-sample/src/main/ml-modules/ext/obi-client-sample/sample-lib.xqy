xquery version "1.0-ml";

module namespace sample = "urn:obi-client-sample:sample";

(:
This is a sample library module that will be loaded using the REST API /v1/ext service. This service requires that all
modules be installed in the /ext directory.
:)

declare function echo($str as xs:string?) as xs:string
{
  "You said: " || $str
};
