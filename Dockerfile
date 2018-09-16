FROM centos:centos7

RUN yum -y update; yum clean all

RUN yum -y install epel-release; yum clean all

RUN yum -y install centos-release-scl; yum clean all
RUN yum-config-manager -y --enable centos-sclo-rh-testing
RUN yum -y install rh-python36

RUN echo "scl enable rh-python36 bash" > /etc/profile.d/python.sh

#https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-2017

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo

RUN yum -y remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
RUN ACCEPT_EULA=Y yum -y install msodbcsql17
# optional: for bcp and sqlcmd
RUN ACCEPT_EULA=Y yum -y install mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
#source ~/.bashrc
# optional: for unixODBC development headers
RUN yum -y install unixODBC-devel

ADD app /app

#RUN pip install -r /app/python/requirements.txt

CMD [ "/bin/sh", "-c", "while true; do echo hello; sleep 10; done" ]