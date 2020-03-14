Solr for CKAN on dokku
======================

This repo is what's needed to do a Dockerfile deploy of Solr, configured for
CKAN, on the dokku platform.

A docker volume is used for persistence because new pushes to the dokku app rebuilds the container, wiping data stored within it. That's not the end of the world, CKAN can easily rebuild its index on solr, but it does mean some broken search functionality until that's detected and done.

Installation
------------

### Create a named docker volume

```
docker volume create --name ckan-solr
```

### Create a dokku app

```
dokku apps:create ckan-solr
```

Add the dokku app remote to your loca git clone

```
git remote add dokku dokku@dokku7.code4sa.org:ckan-solr
```

### Configure it to use the volume

```
dokku docker-options:add ckan-solr run,deploy --volume ckan-solr:/opt/solr/server/solr/ckan
dokku docker-options:add ckan-solr run,deploy --volume ckan-solr:/opt/solr/server/solr/ckan-sandbox
dokku docker-options:add ckan-solr run,deploy --volume solr-budgetportal:/opt/solr/server/solr/budgetportal/data
dokku docker-options:add ckan-solr run,deploy --volume solr-budgetportal-staging:/opt/solr/server/solr/budgetportal-staging/data
dokku docker-options:add ckan-solr run,deploy --volume solr-budgetportal-irmdemo:/opt/solr/server/solr/budgetportal-irmdemo/data
dokku docker-options:add ckan-solr run,deploy --volume solr-budgetportal-sandbox:/opt/solr/server/solr/budgetportal-sandbox/data
```

### Deploy the app

Push the app to the dokku remote

```
git push dokku master
```