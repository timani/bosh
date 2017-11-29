require 'spec_helper'

describe 'blobstore.conf.erb' do
  context 'allow_http is true' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/blobstore.conf.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'ipv6_listen' => true,
              'port' => 25550,
              'max_upload_size' => 300,
              'allow_http' => true
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
server {
  listen unix:/var/vcap/sys/run/blobstore/backend.sock;
  listen 25550 ssl;
  listen [::]:25550 ssl;


  server_name "";

  access_log  /var/vcap/sys/log/blobstore/blobstore_access.log common_event_format;
  error_log   /var/vcap/sys/log/blobstore/blobstore_error.log;

  client_max_body_size 300;

  
  error_page 497 = @handler;
  

  ssl_certificate /var/vcap/jobs/blobstore/config/server_tls_cert.pem;
  ssl_certificate_key /var/vcap/jobs/blobstore/config/server_tls_private_key.pem;

  location / {
    root /var/vcap/store/blobstore/store/;

    dav_methods DELETE PUT;
    create_full_put_path on;

    auth_basic "Blobstore Read";
    auth_basic_user_file read_users;

    limit_except GET {
      auth_basic "Blobstore Write";
      auth_basic_user_file write_users;
    }
  }

  location @handler {
    proxy_pass http://unix:/var/vcap/sys/run/blobstore/backend.sock:$request_uri;
  }
}
        HEREDOC
      end
    end
  end

  context 'allow_http is false' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/blobstore.conf.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'ipv6_listen' => true,
              'port' => 25550,
              'max_upload_size' => 300,
              'allow_http' => false
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
server {
  listen unix:/var/vcap/sys/run/blobstore/backend.sock;
  listen 25550 ssl;
  listen [::]:25550 ssl;


  server_name "";

  access_log  /var/vcap/sys/log/blobstore/blobstore_access.log common_event_format;
  error_log   /var/vcap/sys/log/blobstore/blobstore_error.log;

  client_max_body_size 300;

  

  ssl_certificate /var/vcap/jobs/blobstore/config/server_tls_cert.pem;
  ssl_certificate_key /var/vcap/jobs/blobstore/config/server_tls_private_key.pem;

  location / {
    root /var/vcap/store/blobstore/store/;

    dav_methods DELETE PUT;
    create_full_put_path on;

    auth_basic "Blobstore Read";
    auth_basic_user_file read_users;

    limit_except GET {
      auth_basic "Blobstore Write";
      auth_basic_user_file write_users;
    }
  }

  location @handler {
    proxy_pass http://unix:/var/vcap/sys/run/blobstore/backend.sock:$request_uri;
  }
}
        HEREDOC
      end
    end
  end

  context 'ipv6_listen is true' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/blobstore.conf.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'ipv6_listen' => true,
              'port' => 25550,
              'max_upload_size' => 300,
              'allow_http' => true
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
server {
  listen unix:/var/vcap/sys/run/blobstore/backend.sock;
  listen 25550 ssl;
  listen [::]:25550 ssl;


  server_name "";

  access_log  /var/vcap/sys/log/blobstore/blobstore_access.log common_event_format;
  error_log   /var/vcap/sys/log/blobstore/blobstore_error.log;

  client_max_body_size 300;

  
  error_page 497 = @handler;
  

  ssl_certificate /var/vcap/jobs/blobstore/config/server_tls_cert.pem;
  ssl_certificate_key /var/vcap/jobs/blobstore/config/server_tls_private_key.pem;

  location / {
    root /var/vcap/store/blobstore/store/;

    dav_methods DELETE PUT;
    create_full_put_path on;

    auth_basic "Blobstore Read";
    auth_basic_user_file read_users;

    limit_except GET {
      auth_basic "Blobstore Write";
      auth_basic_user_file write_users;
    }
  }

  location @handler {
    proxy_pass http://unix:/var/vcap/sys/run/blobstore/backend.sock:$request_uri;
  }
}
        HEREDOC
      end
    end
  end

  context 'ipv6_listen is false' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/blobstore.conf.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'ipv6_listen' => false,
              'port' => 25550,
              'max_upload_size' => 300,
              'allow_http' => true
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
server {
  listen unix:/var/vcap/sys/run/blobstore/backend.sock;
  listen 25550 ssl;
  


  server_name "";

  access_log  /var/vcap/sys/log/blobstore/blobstore_access.log common_event_format;
  error_log   /var/vcap/sys/log/blobstore/blobstore_error.log;

  client_max_body_size 300;

  
  error_page 497 = @handler;
  

  ssl_certificate /var/vcap/jobs/blobstore/config/server_tls_cert.pem;
  ssl_certificate_key /var/vcap/jobs/blobstore/config/server_tls_private_key.pem;

  location / {
    root /var/vcap/store/blobstore/store/;

    dav_methods DELETE PUT;
    create_full_put_path on;

    auth_basic "Blobstore Read";
    auth_basic_user_file read_users;

    limit_except GET {
      auth_basic "Blobstore Write";
      auth_basic_user_file write_users;
    }
  }

  location @handler {
    proxy_pass http://unix:/var/vcap/sys/run/blobstore/backend.sock:$request_uri;
  }
}
        HEREDOC
      end
    end
  end
end


describe 'server_tls_cert.pem.erb' do
  context 'should render the pem file' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/server_tls_cert.pem.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'tls' => {
                'cert' => {
                  'certificate' => "-----BEGIN CERTIFICATE-----\nCERT\n-----END CERTIFICATE-----"
                }
              }
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
-----BEGIN CERTIFICATE-----
CERT
-----END CERTIFICATE-----
        HEREDOC
      end
    end
  end
end


describe 'server_tls_private_key.pem.erb' do
  context 'should render the pem file' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/server_tls_private_key.pem.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'tls' => {
                'cert' => {
                  'private_key' => "-----BEGIN RSA PRIVATE KEY-----\nPRIVATE KEY\n-----END RSA PRIVATE KEY-----"
                }
              }
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
-----BEGIN RSA PRIVATE KEY-----
PRIVATE KEY
-----END RSA PRIVATE KEY-----
        HEREDOC
      end
    end
  end
end


describe 'ngnix.conf.erb' do
  context 'should updated number of ngnix workers to user provided value' do
    it_should_behave_like 'a rendered file' do
      let(:file_name) { '../jobs/blobstore/templates/nginx.conf.erb' }
      let(:properties) do
        {
          'properties' => {
            'blobstore' => {
              'nginx' => {
                'workers' => 68
              }
            }
          }
        }
      end
      let(:expected_content) do
        <<~HEREDOC
worker_processes 68;
daemon off;

error_log /var/vcap/sys/log/blobstore/error.log;
pid       /var/vcap/sys/run/blobstore/nginx.pid;

events {
  worker_connections 8192;
}

http {
  include      /var/vcap/jobs/blobstore/config/mime.types;
  default_type text/html;

  client_body_temp_path /var/vcap/data/blobstore/tmp/client_body;
  proxy_temp_path /var/vcap/data/blobstore/tmp/proxy;
  fastcgi_temp_path /var/vcap/data/blobstore/tmp/fastcgi;
  uwsgi_temp_path /var/vcap/data/blobstore/tmp/uwsgi;
  scgi_temp_path /var/vcap/data/blobstore/tmp/scgi;

  map $status $severity {
    ~^[23]  1;
    default 7;
  }

  log_format common_event_format 'CEF:0|CloudFoundry|BOSH|-|blobstore_api|$request_uri|$severity|'
                                 'requestClientApplication=$remote_user '
                                 'requestMethod=$request_method '
                                 'src=$remote_addr spt=$remote_port '
                                 'cs1=Basic cs1Label=authType '
                                 'cs2=$status cs2Label=responseStatus';

  access_log	  /var/vcap/sys/log/blobstore/access.log common_event_format;
  server_tokens off;

  sendfile    on;
  sendfile_max_chunk 256m;
  tcp_nopush  on;
  tcp_nodelay on;

  keepalive_timeout 75 20;

  gzip                 on;
  gzip_min_length      1250;
  gzip_buffers         16 8k;
  gzip_comp_level      2;
  gzip_proxied         any;
  gzip_types           text/plain text/css application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript;
  gzip_vary            on;
  gzip_disable         "MSIE [1-6]\\.(?!.*SV1)";

  include /var/vcap/jobs/blobstore/config/sites/*;
}
        HEREDOC
      end
    end
  end
end
