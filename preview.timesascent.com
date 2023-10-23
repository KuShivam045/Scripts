# Expires map
#map $sent_http_content_type $expires {
 #   default                    off;
 #   text/html                  epoch;
 #   text/css                   max;
 #   application/javascript     max;
 #   ~image/                    max;
#}


server {
	server_name 13.251.68.63  api.timesascent.com;
        location = /favicon.ico { access_log off; log_not_found off; }
	location /static/ {
		root /home/ubuntu/timesAscentApi/;
	}
	location /{
		proxy_read_timeout 300;
                proxy_connect_timeout 300;
                proxy_send_timeout 300;
		include proxy_params;
		proxy_pass http://unix:run/gunicorn.sock;
	}
	location /epaper/ {
		autoindex off;
		root /home/ubuntu/;
	}
	location /recruiterpostjob/{
		autoindex off;
		root /home/ubuntu/;
	}
	location /recruiterprofile/{
		autoindex off;
		root /home/ubuntu/;
	}
	location /writewithus/{
		autoindex off;
		root /home/ubuntu/;
	}


	


	
 	location /wecare/{
                autoindex off;
                root /home/ubuntu/;
        }
	location /media/{
		autoindex off;
		root /ndata/;
	}
	location /nginx_status {
                stub_status on;
                access_log off;
                allow 115.243.33.211;
                allow 103.74.227.242;
                deny all;
        }


    listen 443 ssl; # managed by Certbot
    expires $expires;
    ssl_certificate /etc/letsencrypt/live/api.timesascent.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/api.timesascent.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}


server {
    if ($host = api.timesascent.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	server_name 13.251.68.63  api.timesascent.com;
    listen 80;
    expires $expires;

    return 404; # managed by Certbot


}

#map $cache $control {
#    1       "no-cache, public, max-age=1200";
#}

#map $cache $expires {
#    1       1d;
#    default on;
#}

#map $uri $cache {
#    ~*\.(js|css|png|jpe?g|gif|ico|json|webp)$    1;

#}




server {
    
    listen 80;
    server_name www.timesascent.com;
    return 301 $scheme://timesascent.com$request_uri;
}





server {
	listen 80;
	listen 443;
#Cache Expires Check
  #      expires $expires;

	server_name   timesascent.com paperads.timesascent.com dp3hb3l1fzx0s.cloudfront.net;
        location = /favicon.ico { access_log off; log_not_found off; }
	gzip on;
	gzip_disable "msie6";
	gzip_vary on;
	gzip_proxied any;
	gzip_comp_level 6;
	gzip_buffers 16 8k;
	gzip_min_length 256;
#        add_header Cache-Control $control;
	gzip_types text/plain text/css application/json application/javascript text/xml application/xml+rss application/xml application/x-javascript text/javascript application/vnd.ms-fontobject application/x-font-ttf font/opentype image/svg+xml image/x-icon;
#	location /static/ {
#		add_header Cache-Control $control;
#		root /home/ubuntu/timesascent-react/build;
#	}
	location /{
		
		
		proxy_pass http://localhost:3000;
		proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;

		proxy_cache my_cache;
		proxy_cache_bypass  $http_cache_control;

 #               proxy_cache_bypass $http_upgrade;
#		add_header Cache-control $control;
	#	root /home/ubuntu/timesascent-react/build;
	#	try_files $uri /index.html;
		
	}

	location /https://www.google-analytics.com/ {
		proxy_cache off;
	}

	location /epaper/ {
		autoindex on;
		root /home/ubuntu/;
	}
	location /images/{
		autoindex on;
		root /home/ubuntu/;
	}
	location /epaper-test/{
		autoindex on;
		root /ndata/paperad_live_apachedoc/;
	}
	location /recruiterpostjob/{
		autoindex on;
		root /home/ubuntu/;
	}
	location /recruiterprofile/{
		autoindex on;
		root /home/ubuntu/;
	}
	location /candidateV2/{
		autoindex on;
		root /home/ubuntu/;
	}
	location /candidate/{
		autoindex on;
		root /home/ubuntu/;
	}
	location /sitemap_index.xml/{
	        autoindex on;
		root /ndata/;
	}
	location /Sitemap/{
		autoindex on;
	        root /ndata/;
	}

	location /Sitemap/new/{
		autoindex on;
		root /ndata/;
	}


	location /media/{
		autoindex on;
		root /ndata/;
	}
	location /et_images/{
		autoindex on;
		root /ndata/;
	}

	location /serverfile/{
		autoindex on;
		root /ndata/;
	}

	
	location /podcast/{
                autoindex on;
                root /ndata/;
        }


	location /hcb/{
		autoindex on;
		root /ndata/;
	}

	location /nginx_status {
                stub_status on;
                access_log off;
                allow 115.243.33.211;
                allow 103.74.227.242;
		allow 52.76.135.100;
		allow 52.76.232.153;
		allow 52.220.207.173;
                allow all;
        }
	
	location /JSON/ {

                root /ndata;
        }
	

	location /FacebookJobs/ {

                root /ndata;
        }



	location /wecareoffer/ {

                root /ndata;
        }
	
}




#server {
    #if ($host = https://www.timesascent.com) {
        #return 301 https://timesascent.com$request_uri;
    #} 
    #if ($host = timesascent.com) {
        #return 301 https://$host$request_uri;

    #}
        #listen 80 ;
        #listen [::]:80 ;
    #server_name timesascent.com www.timesascent.com;
    #return 404; 
#}

#server {
 #   listen 80;
 #   listen 443 ssl;
 #   server_name www.timesascent.com timesascent.com;
 #   return 301 https://timesascent.com$request_uri;
#}

#server {
#    listen 80;
#    listen 443 ssl;
#    server_name www.timesascent.com;
#    return 301 $scheme://timesascent.com$request_uri;
#}



#server {

#    listen 443 ssl;
#    server_name educationtimes.com;

#    location = /post/learning-nginx-redirects {
#        return 301 $scheme://educationtimes.com/login/;
#    }

#    location = /api/auth/callback/google {
#        return 301 $scheme://educationtimes.com/api/auth/callback/google/;
#    }        

#    return 301 $scheme://www.educationtimes.com$request_uri;
#}



server {

    listen 443 ssl;
    server_name educationtimes.com;

    location = /login {
#        if ($arg_redirect = "true" ) {
            return 301 $scheme://educationtimes.com/login$request_uri;
        }
    
    location = /api/auth/callback/google {
 #       if ($arg_redirect = "true") {
            return 301 $scheme://educationtimes.com/api/auth/callback/google$request_uri;
        }
    
    location = / {
	 return 301 $scheme://www.educationtimes.com$request_uri;
	}
}

#server {

 #   listen 443 ssl;
  #  server_name www.educationtimes.com/login;

   # return 301 $scheme://educationtimes.com/login$request_uri;

#}


server {
        listen 80;
        listen 443;
        #Cache Expires Check;
        expires $expires;

#        server_name   www.educationtimes.com ;
#	return 301 $scheme://educationtimes.com$request_uri;
	server_name   educationtimes.com www.educationtimes.com ;
#	return 301 $scheme://www.educationtimes.com$request_uri;

        location = /favicon.ico { access_log off; log_not_found off; }
        gzip on;
        gzip_disable "msie6";
        gzip_vary on;
        gzip_proxied any;
        gzip_comp_level 6;
        gzip_buffers 16 8k;
        gzip_min_length 256;
#        add_header Cache-Control $control;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml+rss application/xml application/x-javascript text/javascript application/vnd.ms-fontobject application/x-font-ttf font/opentype image/svg+xml image/x-icon;

        location /{

                proxy_pass http://localhost:3004;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;

		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header Cookie $http_cookie;  # Pass the 'Cookie' header



  #              proxy_cache_bypass $http_upgrade;
 #               add_header Cache-control $control;
 

#		proxy_cache my_cache;
 #               proxy_cache_revalidate on;
  #              proxy_cache_min_uses 3;
   #             proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
    #            proxy_cache_background_update on;
     #           proxy_cache_lock on;

       }

        location /sitemap_index.xml/ {
                autoindex on;
                root /ndata/;
        }

        location /Sitemap/ {
                autoindex on;
                root /ndata/;
        }

        location /media/ {
                autoindex on;
                root /ndata/;
        }

        location /et_images/ {
                autoindex on;
                root /ndata/;
        }
	location /etsitemap/{
		autoindex on;
		root /ndata/;
	}

	location /et_json/ {
		autoindex on;
		root /ndata/;
	}

	location /nginx_status {
                stub_status on;
                access_log off;
                allow 115.243.33.211;
                allow 103.74.227.242;
                allow 52.76.135.100;
                allow 52.76.232.153;
                allow 52.220.207.173;
                allow all;
        }


	

}


