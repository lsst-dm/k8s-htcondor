FROM centos:centos7

USER root
WORKDIR /root

#
# STABLE version of the HTCondor repo
#
ARG CONDOR_URL=https://research.cs.wisc.edu/htcondor/yum
ARG CONDOR_REPO=${CONDOR_URL}/repo.d/htcondor-stable-rhel7.repo

#
# Always install a specific version, for reproducibility
#
ARG CONDOR_VERSION=condor-8.6.4-1.el7.x86_64

#
#
RUN yum -y install yum-utils wget which tar file && \
    wget ${CONDOR_URL}/RPM-GPG-KEY-HTCondor && \
    rpm --import RPM-GPG-KEY-HTCondor && \
    yum-config-manager --add-repo ${CONDOR_REPO} && \
    yum -y install ${CONDOR_VERSION} && \
    yum clean all

COPY scripts/run.sh /root
COPY manager/condor_config.local /etc/condor/condor_config.local

EXPOSE 9618

CMD [ "./run.sh"  ]
