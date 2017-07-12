FROM centos:centos7

USER root
WORKDIR /root

RUN yum -y install yum-utils wget which tar file && \
    wget https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor && \
    rpm --import RPM-GPG-KEY-HTCondor && \
    yum-config-manager --add-repo https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo && \
    yum -y install condor.x86_64 && \
    yum clean all

COPY scripts/run.sh /root
COPY external/condor_config.local /etc/condor/condor_config.local

EXPOSE 9618

CMD [ "./run.sh"  ]
