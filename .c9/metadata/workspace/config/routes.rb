{"filter":false,"title":"routes.rb","tooltip":"/config/routes.rb","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":33,"column":2},"end":{"row":33,"column":62},"action":"remove","lines":["post '/issues/:id/attachment', to: 'issues#createAttachment'"],"id":1821,"ignore":true},{"start":{"row":33,"column":2},"end":{"row":33,"column":82},"action":"insert","lines":["post '/issues/:issue_id/comments/:id/attachment' => \"comments#create_attachment\""]}],[{"start":{"row":33,"column":2},"end":{"row":33,"column":82},"action":"remove","lines":["post '/issues/:issue_id/comments/:id/attachment' => \"comments#create_attachment\""],"id":1822,"ignore":true},{"start":{"row":33,"column":2},"end":{"row":33,"column":62},"action":"insert","lines":["post '/issues/:id/attachment', to: 'issues#createAttachment'"]}]]},"ace":{"folds":[],"scrolltop":60,"scrollleft":0,"selection":{"start":{"row":30,"column":5},"end":{"row":30,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":3,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1512930036610,"hash":"1406024f35ace11f532819499dda100ba6e6e154"}