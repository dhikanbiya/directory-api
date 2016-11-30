<?php
// Application middleware

// e.g: $app->add(new \Slim\Csrf\Guard);
// $pdo = $container->get('db');

// $mw_auth = $app->add(new \Slim\Middleware\HttpBasicAuthentication([
//     "path" => "/login",
//     "realm" => "Protected",
//     "authenticator" => new \Slim\Middleware\HttpBasicAuthentication\PdoAuthenticator([
//         "pdo" => $pdo        
//     ])
// ]));


$app->add(function ($request, $response, $next) {   

   $input = $request->getParsedBody();
   $uri = $request->getUri()->getPath();
   switch ($uri) {
   	case '/upload':

   	break;


   	case '/register':

   		$sth = $this->db->prepare("SELECT * FROM tbl_account WHERE email = :email");
		$sth->execute(
		  array(
		    "email" => $input['email']		        
		  )
		);
		$count = $sth->rowCount();

   		if($count==0){
   			$response = $next($request, $response);	
   		}else{
   			$response = $this->response->withJson(array('status'=>'false','data'=>array('messages'=>'already registered')));
   		}
   		
   	break;
   	
   	case '/login':
   		$response = $next($request, $response);
   	break;

   	default:
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
   	break;  
   	 }

   
	return $response;
});
