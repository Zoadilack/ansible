FROM node

MAINTAINER jakelitwicki <jake.litwicki@gmail.com>

RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Add Scripts
ADD scripts/bootstrap.sh /bootstrap.sh
ADD scripts/letsencrypt-setup /usr/bin/letsencrypt-setup
ADD scripts/letsencrypt-renew /usr/bin/letsencrypt-renew
RUN chmod 755 /usr/bin/letsencrypt-setup && chmod 755 /usr/bin/letsencrypt-renew && chmod 755 /bootstrap.sh

EXPOSE 443 80

CMD ["/bootstrap.sh"]