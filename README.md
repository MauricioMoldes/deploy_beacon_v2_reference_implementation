# About

# Beacon V2

Beacon v2 is an API specification established by the Global Alliance for Genomics and Health initiative (GA4GH) that defines an open standard for federated discovery of genomic and phenotypic data in biomedical research and clinical applications.

The current version of the specification is v2 and consists of two components, the Framework and the Models. The Framework defines the format for the requests and responses, whereas the Models define the structure of the biological data response. The overall function of these two components is to provide the instructions to design a REST API (REpresentational State Transfer Application Programming Interface) with OpenAPI Specification (OAS). The OAS defines a standard, language-agnostic interface that is used by software developers to implement REST APIs.

<img align="center" src="https://b2ri-documentation.readthedocs.io/en/latest/img/framework-and-models.png">

# Beacon V2 Reference Implementation

To demonstrate Beacon v2 capabilities and to facilitate the adoption, ELIXIR organization has been funding the development of the Beacon v2 Reference Implementation (B2RI). Developed at the Centre for Genomic Regulation (CRG), the B2RI is a free open source Linux-based set of tools that allow lighting up a Beacon out-of-the-box.

The B2RI includes:

 * Tools for loading metadata (including phenotypic data) and genomic variants (from a VCF file) into a database.
 * A MongoDB database.
 * The Beacon query engine (i.e., REST API).
 * An example dataset consisting of synthetic-data (CINECA synthetic cohort EUROPE UK1).

The B2RI is conceived as a customizable local solution, delivered with a basic configuration. The software is written in Python, Perl and Bash and has a command-line interface (CLI) for control and operation.

# Dockerized Deployment Beacon Reference Implementation Server

Here, we present a proof of concept for the dockerized deployment of the beacon v2 reference implementation that includes the following containers: 
 * beacon-ri-tools, the container for loading metadata and genomic variants into a dataset.
 * mongo, the mongo database.
 * beacon, the container with the query engine.  
 * mongo-express, the container with web-based MongoDB admin interface. 
 * training-ui, the container with the django web app to query beacon.


![B2Ri containers](Screenshot%20from%202022-12-13%2011-09-05.png)

# Installation

## requires

```
Open ports - 27017, 8080, 8081, 5050
```

<a href="https://docs.docker.com/compose/install/" target="_blank">docker-compose</a>
<a href="https://www.mongodb.com/docs/database-tools/installation/installation/" target="_blank">mongoimport</a>

## install

```bash
$ bash deploy_beacon_implemenetation_programmatically.sh
```

## Usage

 * http://localhost:8080/ - training-ui
 * http://localhost:5050/api/ - beacon-api
 * http://localhost:27017 - mongo-db
 * http://localhost:8081 - mongo-express


# Citation

Rueda, M, Ariosa R. "Beacon v2 Reference Implementation: a toolkit to enable federated sharing of genomic and phenotypic data". Bioinformatics, btac568, https://doi.org/10.1093/bioinformatics/btac568

# Acknowledgement

This study was funded by ELIXIR, the research infrastructure for life-science data (ELIXIR Beacon Implementation Studies 2019-2021 and 2022-2023).


