FROM znc:1.6
MAINTAINER  Jason Dudash "jason.dudash@gmail.com"

USER root

LABEL io.k8s.description="Run ZNC search in OpenShift" \
      io.k8s.display-name="ZNC 1.6" \
      io.openshift.expose-services="6697:http" \
      io.openshift.tags="znc,solr1.6" \
      io.openshift.s2i.scripts-url="image:///${STI_SCRIPTS_PATH}"

# If we need to add files as part of every ZNC conf, they could go here
# COPY ./modules/ /znc-data/modules

# Give the ZNC directory to root group (not root user)
# https://docs.openshift.org/latest/creating_images/guidelines.html#openshift-origin-specific-guidelines
RUN chgrp -R 0 /znc-data \
  && chmod -R g+rwX /znc-data

RUN chgrp -R 0 /znc-data \
  && chmod -R g+rwX /znc-data

USER 8983