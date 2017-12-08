{"filter":false,"title":"application.rb","tooltip":"/config/application.rb","undoManager":{"mark":44,"position":44,"stack":[[{"start":{"row":23,"column":65},"end":{"row":24,"column":0},"action":"insert","lines":["",""],"id":2},{"start":{"row":24,"column":0},"end":{"row":24,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":24,"column":4},"end":{"row":29,"column":3},"action":"insert","lines":["config.middleware.insert_before 0, \"Rack::Cors\" do","  allow do","    origins '*'","    resource '*', :headers => :any, :methods => :any","  end","end"],"id":4}],[{"start":{"row":25,"column":2},"end":{"row":25,"column":4},"action":"insert","lines":["  "],"id":5}],[{"start":{"row":25,"column":4},"end":{"row":25,"column":6},"action":"insert","lines":["  "],"id":6}],[{"start":{"row":26,"column":6},"end":{"row":26,"column":7},"action":"insert","lines":["7"],"id":7}],[{"start":{"row":26,"column":6},"end":{"row":26,"column":7},"action":"remove","lines":["7"],"id":8}],[{"start":{"row":26,"column":4},"end":{"row":26,"column":6},"action":"insert","lines":["  "],"id":9}],[{"start":{"row":26,"column":6},"end":{"row":26,"column":8},"action":"insert","lines":["  "],"id":10}],[{"start":{"row":27,"column":4},"end":{"row":27,"column":6},"action":"insert","lines":["  "],"id":11}],[{"start":{"row":27,"column":6},"end":{"row":27,"column":8},"action":"insert","lines":["  "],"id":12}],[{"start":{"row":28,"column":2},"end":{"row":28,"column":4},"action":"insert","lines":["  "],"id":13}],[{"start":{"row":28,"column":4},"end":{"row":28,"column":6},"action":"insert","lines":["  "],"id":14}],[{"start":{"row":29,"column":0},"end":{"row":29,"column":2},"action":"insert","lines":["  "],"id":15}],[{"start":{"row":29,"column":2},"end":{"row":29,"column":4},"action":"insert","lines":["  "],"id":16}],[{"start":{"row":29,"column":7},"end":{"row":30,"column":0},"action":"insert","lines":["",""],"id":17},{"start":{"row":30,"column":0},"end":{"row":30,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":30,"column":4},"end":{"row":31,"column":0},"action":"insert","lines":["",""],"id":18},{"start":{"row":31,"column":0},"end":{"row":31,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":31,"column":4},"end":{"row":34,"column":3},"action":"insert","lines":["config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'http://my-web-service-consumer-site.com',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\")","  }"],"id":20}],[{"start":{"row":34,"column":2},"end":{"row":34,"column":4},"action":"insert","lines":["  "],"id":21}],[{"start":{"row":32,"column":38},"end":{"row":32,"column":77},"action":"remove","lines":["http://my-web-service-consumer-site.com"],"id":22},{"start":{"row":32,"column":38},"end":{"row":32,"column":92},"action":"insert","lines":["https://isuea-traker-asw-paualos3.c9users.io/issues/61"]}],[{"start":{"row":32,"column":91},"end":{"row":32,"column":92},"action":"remove","lines":["1"],"id":23}],[{"start":{"row":32,"column":90},"end":{"row":32,"column":91},"action":"remove","lines":["6"],"id":24}],[{"start":{"row":32,"column":89},"end":{"row":32,"column":90},"action":"remove","lines":["/"],"id":25}],[{"start":{"row":32,"column":88},"end":{"row":32,"column":89},"action":"remove","lines":["s"],"id":26}],[{"start":{"row":32,"column":87},"end":{"row":32,"column":88},"action":"remove","lines":["e"],"id":27}],[{"start":{"row":32,"column":86},"end":{"row":32,"column":87},"action":"remove","lines":["u"],"id":28}],[{"start":{"row":32,"column":85},"end":{"row":32,"column":86},"action":"remove","lines":["s"],"id":29}],[{"start":{"row":32,"column":84},"end":{"row":32,"column":85},"action":"remove","lines":["s"],"id":30}],[{"start":{"row":32,"column":83},"end":{"row":32,"column":84},"action":"remove","lines":["i"],"id":31}],[{"start":{"row":33,"column":69},"end":{"row":34,"column":88},"action":"insert","lines":["","  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, api_key, Authorization');"],"id":32}],[{"start":{"row":33,"column":69},"end":{"row":33,"column":70},"action":"insert","lines":[","],"id":33}],[{"start":{"row":34,"column":0},"end":{"row":34,"column":2},"action":"insert","lines":["  "],"id":34}],[{"start":{"row":34,"column":4},"end":{"row":34,"column":18},"action":"remove","lines":["res.setHeader("],"id":35}],[{"start":{"row":34,"column":4},"end":{"row":34,"column":6},"action":"insert","lines":["  "],"id":36}],[{"start":{"row":34,"column":4},"end":{"row":34,"column":6},"action":"remove","lines":["  "],"id":37}],[{"start":{"row":34,"column":34},"end":{"row":34,"column":35},"action":"remove","lines":[","],"id":38}],[{"start":{"row":34,"column":34},"end":{"row":34,"column":35},"action":"insert","lines":["="],"id":39}],[{"start":{"row":34,"column":35},"end":{"row":34,"column":36},"action":"insert","lines":[">"],"id":40}],[{"start":{"row":34,"column":34},"end":{"row":34,"column":35},"action":"insert","lines":[" "],"id":41}],[{"start":{"row":34,"column":76},"end":{"row":34,"column":77},"action":"remove","lines":[")"],"id":42}],[{"start":{"row":34,"column":76},"end":{"row":34,"column":77},"action":"remove","lines":[";"],"id":43}],[{"start":{"row":24,"column":0},"end":{"row":35,"column":5},"action":"remove","lines":["    config.middleware.insert_before 0, \"Rack::Cors\" do","      allow do","        origins '*'","        resource '*', :headers => :any, :methods => :any","      end","    end","    ","    config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'https://isuea-traker-asw-paualos3.c9users.io/',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\"),","    'Access-Control-Allow-Headers' => 'Content-Type, api_key, Authorization'","    }"],"id":44,"ignore":true},{"start":{"row":24,"column":0},"end":{"row":41,"column":7},"action":"insert","lines":["  # Do not swallow errors in after_commit/after_rollback callbacks.","    config.active_record.raise_in_transactional_callbacks = true","    config.middleware.insert_before 0, \"Rack::Cors\", :debug => true, :logger => (-> { Rails.logger }) do","      allow do","        origins '*'","","        resource '/cors',","          :headers => :any,","          :methods => [:post],","          :credentials => true,","          :max_age => 0","","        resource '*',","          :headers => :any,","          :methods => [:get, :post, :delete, :put, :patch, :options, :head],","          :max_age => 0","      end","    end"]}],[{"start":{"row":24,"column":0},"end":{"row":41,"column":7},"action":"remove","lines":["  # Do not swallow errors in after_commit/after_rollback callbacks.","    config.active_record.raise_in_transactional_callbacks = true","    config.middleware.insert_before 0, \"Rack::Cors\", :debug => true, :logger => (-> { Rails.logger }) do","      allow do","        origins '*'","","        resource '/cors',","          :headers => :any,","          :methods => [:post],","          :credentials => true,","          :max_age => 0","","        resource '*',","          :headers => :any,","          :methods => [:get, :post, :delete, :put, :patch, :options, :head],","          :max_age => 0","      end","    end"],"id":45,"ignore":true},{"start":{"row":24,"column":0},"end":{"row":35,"column":5},"action":"insert","lines":["    config.middleware.insert_before 0, \"Rack::Cors\" do","      allow do","        origins '*'","        resource '*', :headers => :any, :methods => :any","      end","    end","    ","    config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'https://isuea-traker-asw-paualos3.c9users.io/',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\"),","    'Access-Control-Allow-Headers' => 'Content-Type, api_key, Authorization'","    }"]}],[{"start":{"row":30,"column":0},"end":{"row":35,"column":5},"action":"remove","lines":["    ","    config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'https://isuea-traker-asw-paualos3.c9users.io/',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\"),","    'Access-Control-Allow-Headers' => 'Content-Type, api_key, Authorization'","    }"],"id":46,"ignore":true}],[{"start":{"row":30,"column":0},"end":{"row":35,"column":5},"action":"insert","lines":["    ","    config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'https://isuea-traker-asw-paualos3.c9users.io/',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\"),","    'Access-Control-Allow-Headers' => 'Content-Type, api_key, Authorization'","    }"],"id":47,"ignore":true}],[{"start":{"row":30,"column":0},"end":{"row":35,"column":5},"action":"remove","lines":["    ","    config.action_dispatch.default_headers = {","    'Access-Control-Allow-Origin' => 'https://isuea-traker-asw-paualos3.c9users.io/',","    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(\",\"),","    'Access-Control-Allow-Headers' => 'Content-Type, api_key, Authorization'","    }"],"id":48,"ignore":true}]]},"ace":{"folds":[],"scrolltop":295,"scrollleft":0,"selection":{"start":{"row":24,"column":0},"end":{"row":24,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":17,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1512139540173,"hash":"af15566f6c7b17f12e73cefab89c27454a04c3b3"}