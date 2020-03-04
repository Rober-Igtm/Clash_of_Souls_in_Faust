<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:patten>
        <sch:rule context="cast/faction">
            <sch:assert test="@id">This is my message!</sch:assert>
        </sch:rule>
    </sch:patten>
</sch:schema>