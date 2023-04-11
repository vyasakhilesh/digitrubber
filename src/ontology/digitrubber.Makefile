## Customize Makefile settings for digitrubber
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


## Module for ontology: chebi

$(IMPORTDIR)/chebi_import.owl: $(MIRRORDIR)/chebi.owl $(IMPORTDIR)/chebi_terms_combined.txt
	if [ $(IMP) = true ] && [ $(IMP_LARGE) = true ]; then $(ROBOT) extract -i $< -T $(IMPORTDIR)/chebi_terms_combined.txt --force true  --copy-ontology-annotations true --individuals include --method MIREOT \
    --upper-term "http://purl.obolibrary.org/obo/CHEBI_24431" \
	--lower-term "http://purl.obolibrary.org/obo/CHEBI_17514" \
	--lower-term "http://purl.obolibrary.org/obo/CHEBI_28798" \
	--lower-term "http://purl.obolibrary.org/obo/CHEBI_133602" \
	--lower-term "http://purl.obolibrary.org/obo/CHEBI_82298" \
	--lower-term "http://purl.obolibrary.org/obo/CHEBI_84292" \
        --lower-term "http://purl.obolibrary.org/obo/CHEBI_33471" \
        --lower-term "http://purl.obolibrary.org/obo/CHEBI_51422" \
        --lower-term "http://purl.obolibrary.org/obo/CHEBI_38418" \
        --lower-term "http://purl.obolibrary.org/obo/CHEBI_35489" \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

