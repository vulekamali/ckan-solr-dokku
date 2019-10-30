FROM solr:6.6.2


###########################################
## ckan core

# Create Directories
RUN mkdir -p /opt/solr/server/solr/ckan/conf
RUN mkdir -p /opt/solr/server/solr/ckan/data

# Adding Files
ADD ./cores/ckan/conf/solrconfig.xml \
./cores/ckan/conf/schema.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/currency.xml \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.2/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
/opt/solr/server/solr/ckan/conf/

# Create Core.properties
RUN echo name=ckan > /opt/solr/server/solr/ckan/core.properties

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/ckan
USER $SOLR_USER:$SOLR_USER


###########################################
## Budget Portal IRM Demo core

# Create Directories
RUN mkdir -p /opt/solr/server/solr/budgetportal-irmdemo/conf
RUN mkdir -p /opt/solr/server/solr/budgetportal-irmdemo/data

# Adding Files
ADD ./cores/budgetportal-irmdemo/conf /opt/solr/server/solr/budgetportal-irmdemo/conf/
RUN cp -r /opt/solr/example/files/conf/lang /opt/solr/server/solr/budgetportal-irmdemo/conf/ && \
    cp -r /opt/solr/example/files/conf/stopwords.txt /opt/solr/server/solr/budgetportal-irmdemo/conf/ && \
    cp -r /opt/solr/example/files/conf/synonyms.txt /opt/solr/server/solr/budgetportal-irmdemo/conf/ && \
    cp -r /opt/solr/example/files/conf/protwords.txt /opt/solr/server/solr/budgetportal-irmdemo/conf/ && \
    cp -r /opt/solr/example/files/conf/currency.xml /opt/solr/server/solr/budgetportal-irmdemo/conf/ && \
    cp -r /opt/solr/example/files/conf/elevate.xml /opt/solr/server/solr/budgetportal-irmdemo/conf/

# Create Core.properties
RUN echo name=budgetportal-irmdemo > /opt/solr/server/solr/budgetportal-irmdemo/core.properties

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/budgetportal-irmdemo
USER $SOLR_USER:$SOLR_USER

###########################################
## Budget Portal Prod core

# Create Directories
RUN mkdir -p /opt/solr/server/solr/budgetportal/conf
RUN mkdir -p /opt/solr/server/solr/budgetportal/data

# Adding Files
ADD ./cores/budgetportal/conf /opt/solr/server/solr/budgetportal/conf/
RUN cp -r /opt/solr/example/files/conf/lang /opt/solr/server/solr/budgetportal/conf/ && \
    cp -r /opt/solr/example/files/conf/stopwords.txt /opt/solr/server/solr/budgetportal/conf/ && \
    cp -r /opt/solr/example/files/conf/synonyms.txt /opt/solr/server/solr/budgetportal/conf/ && \
    cp -r /opt/solr/example/files/conf/protwords.txt /opt/solr/server/solr/budgetportal/conf/ && \
    cp -r /opt/solr/example/files/conf/currency.xml /opt/solr/server/solr/budgetportal/conf/ && \
    cp -r /opt/solr/example/files/conf/elevate.xml /opt/solr/server/solr/budgetportal/conf/

# Create Core.properties
RUN echo name=budgetportal > /opt/solr/server/solr/budgetportal/core.properties

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/budgetportal
USER $SOLR_USER:$SOLR_USER

###########################################
## Budget Portal Staging core

# Create Directories
RUN mkdir -p /opt/solr/server/solr/budgetportal-staging/conf
RUN mkdir -p /opt/solr/server/solr/budgetportal-staging/data

# Adding Files
ADD ./cores/budgetportal-staging/conf /opt/solr/server/solr/budgetportal-staging/conf/
RUN cp -r /opt/solr/example/files/conf/lang /opt/solr/server/solr/budgetportal-staging/conf/ && \
    cp -r /opt/solr/example/files/conf/stopwords.txt /opt/solr/server/solr/budgetportal-staging/conf/ && \
    cp -r /opt/solr/example/files/conf/synonyms.txt /opt/solr/server/solr/budgetportal-staging/conf/ && \
    cp -r /opt/solr/example/files/conf/protwords.txt /opt/solr/server/solr/budgetportal-staging/conf/ && \
    cp -r /opt/solr/example/files/conf/currency.xml /opt/solr/server/solr/budgetportal-staging/conf/ && \
    cp -r /opt/solr/example/files/conf/elevate.xml /opt/solr/server/solr/budgetportal-staging/conf/

# Create Core.properties
RUN echo name=budgetportal-staging > /opt/solr/server/solr/budgetportal-staging/core.properties

USER root
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/budgetportal-staging
USER $SOLR_USER:$SOLR_USER
