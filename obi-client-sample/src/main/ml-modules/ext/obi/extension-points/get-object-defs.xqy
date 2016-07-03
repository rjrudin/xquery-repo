xquery version "1.0-ml";

module namespace oxp = "http://marklogic.com/solutions/obi/ext";

declare namespace ont = "http://marklogic.com/solutions/obi/ontology";

(:
By default, OBI just has an object definition for a link. An OBI application will almost always
override this extension point to define its own object definitions, which may include the link
definition provided here.
:)
declare function get-object-defs()
{
  <ont:objectDef xmlns:ont="http://marklogic.com/solutions/obi/ontology">
    <ont:schema>
      <link xmlns="http://marklogic.com/solutions/obi/object/link" xmlns:obj="http://marklogic.com/solutions/obi/object">
        <type />
        <reverseType minOccurs="0" />
        <fromId unsourced="true" />
        <fromType unsourced="true" />
        <toId unsourced="true" />
        <toType unsourced="true" />
      </link>
    </ont:schema>
  </ont:objectDef>,
  <ont:objectDef xmlns:ont="http://marklogic.com/solutions/obi/ontology">
    <ont:schema>
      <person xmlns="urn:obi-client-sample:person">
        <name maxOccurs="unbounded">
          <ont:propertyType>compound</ont:propertyType>
          <ont:compoundProperties>
            <firstName />
            <lastName />
          </ont:compoundProperties>
        </name>
        <phoneNumber maxOccurs="unbounded" />
        <gender />
      </person>
    </ont:schema>
  </ont:objectDef>
};
