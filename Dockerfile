FROM gikoluo/python

COPY doc/requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

ADD . /var/www/kerrigan/

# 6. 初始化生成表结构
#RUN python3 /var/www/kerrigan/db_sync.py

# 7. 日志
VOLUME /var/log/

# 8. 准备文件
COPY doc/nginx_ops.conf /etc/nginx/conf.d/default.conf
COPY doc/supervisor_ops.conf  /etc/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]