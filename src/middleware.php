<?php
// Application middleware

// e.g: $app->add(new \Slim\Csrf\Guard);
$pdo = $container->get('db');

$app->add(new \Slim\Middleware\HttpBasicAuthentication([
    "path" => "/login",
    "realm" => "Protected",
    "authenticator" => new \Slim\Middleware\HttpBasicAuthentication\PdoAuthenticator([
        "pdo" => $pdo        
    ])
]));


$app->add(function ($request, $response, $next) {
   $input = $request->getParsedBody();
   if ($this->reqValidation->hasErrors()) { // check for errors with hasErrors
        $data = array();
        $response = $this->response->withJson(array('status'=>'false','data'=>array($this->reqValidation->getErrors())));
    } else {
	   $sth = $this->db->prepare("SELECT * FROM tbl_token WHERE token = :token and device = :device");
	   $sth->execute(
	      array(
	        "token" => $input['token'],
	        "device" => $input['device']
	      )
	    );
	   $count = $sth->rowCount();
	   if($count > 0){
	    $response = $next($request, $response);
	   }else{
	   $response = $this->response->withJson(array('status'=>'false','data'=>''));
	   }
	}
	return $response;
})->add($container->get('reqValidation'));
 
 
