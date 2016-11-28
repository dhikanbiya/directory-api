<?php
// Routes

$app->post('/register', function ($request, $response) {
   if ($this->regValidation->hasErrors()) { // check for errors with hasErrors
        $data = array();
        return $this->response->withJson(array('status'=>'false','data'=>array($this->regValidation->getErrors())));
    } else {
        $input = $request->getParsedBody();   
        $sql = "INSERT INTO tbl_account(username,email,password,device) VALUES (:username,:email,:password,:device)";
        $sth = $this->db->prepare($sql);
        $sth->execute(array(
            'username' => $input['username'],
            'email' => $input['email'],
            'password' => passhash($input['password']),
            'device' => $input['device']
        ));
         return $this->response->withJson(array('status'=>'true'));        
    }
})->add($container->get('regValidation'));

$app->post('/login',function($request,$response){
    $input = $request->getParsedBody();

    $stmt = $this->db->prepare('SELECT id,password FROM tbl_account WHERE username = :username');
    $stmt->execute(array('username' => $input['username']));      
    $row = $stmt->fetch();
    $hashed = $row['password'];
    $uid = $row['id'];

    $token = bin2hex(openssl_random_pseudo_bytes(16));
    $stmt = $this->db->prepare('INSERT INTO tbl_token(id_account,token) VALUES(:id_account,:token)');
    $stmt->execute(array(
      'id_account' => $uid,
      'token' => $token
    ));      
    return $this->response->withJson(array('status' => 'true','data'=>array('messages'=>'login success','token'=>$token)));    
});

$app->post('/logout',function($request,$response){
  $input = $request->getParsedBody();
  if ($this->reqValidation->hasErrors()) { // check for errors with hasErrors
        $data = array();
        return $this->response->withJson(array('status'=>'false','data'=>array($this->regValidation->getErrors())));
    } else {
      $stmt = $this->db->prepare('DELETE FROM tbl_token WHERE token = :token AND device = :device');
      $stmt->execute(array(
        'token' => $input['token'],
        'device' => $input['device']
        ));      
      return $this->response->withJson(array('status'=>'true','data'=>array('messages'=>'logged out')));
    }
})->add($container->get('reqValidation'));


$app->put('/account/{username}',function($request){
  $input = $request->getParsedBody();
  $id = $request->getAttribute('username');
  $st = $this->db->prepare("UPDATE tbl_account SET address = :address, kecamatan = :kecamatan, kelurahan = :kelurahan, phone_number = :phone WHERE id = $id");
  $st->execute(array(
      'address' => $input['address'],
      'kecamatan' => $input['kecamatan'],
      'kelurahan' => $input['kelurahan'],
      'phone' => $input['phone']
    ));
  return $this->response->withJson(array('status'=>'true','data'=>array('messages'=>'updated')));

});

$app->post('/mall',function ($request, $response){    
    $sth = $this->db->prepare("SELECT * FROM tbl_places_mall ORDER BY id");
    $sth->execute();
    $mall = $sth->fetchAll(); 
    $response = $this->response->withJson(array('status'=>'true','data'=>$mall));        
  return $response;
})->add($container->get('reqValidation'));

$app->post('/mall_event',function($request,$response){
    $input = $request->getParsedBody();       
   
      $sth = $this->db->prepare("SELECT * FROM tbl_event_mall WHERE id_places_mall = :mall_id ORDER BY date DESC");
      $sth->execute(array(
        'mall_id' => $input['mall_id']        
        ));      
      $mall = $sth->fetchAll(); 
   
    return $this->response->withJson(array('status'=>'true','data'=>$mall));        
});

$app->post('/resto',function ($request, $response){    
    $sth = $this->db->prepare("SELECT * FROM tbl_places_resto ORDER BY id");
    $sth->execute();
    $mall = $sth->fetchAll(); 
    $response = $this->response->withJson(array('status'=>'true','data'=>$mall));        
  return $response;
})->add($container->get('reqValidation'));

$app->post('/resto_detail',function($request,$response){
    $input = $request->getParsedBody();       
   
      $sth = $this->db->prepare("SELECT * FROM tbl_places_resto WHERE id = :resto_id ORDER BY id");
      $sth->execute(array(
        'resto_id' => $input['resto_id']        
        ));      
      $mall = $sth->fetchAll(); 
   
    return $this->response->withJson(array('status'=>'true','data'=>$mall));        
});

$app->post('/resto_menu',function($request,$response){
    $input = $request->getParsedBody();       
   
      $sth = $this->db->prepare("SELECT * FROM tbl_menu_resto WHERE id_places_resto = :resto_id ORDER BY id_places_resto");
      $sth->execute(array(
        'resto_id' => $input['resto_id']        
        ));      
      $mall = $sth->fetchAll(); 
   
    return $this->response->withJson(array('status'=>'true','data'=>$mall));        
});

$app->post('/resto_promo',function($request,$response){
    $input = $request->getParsedBody();       
   
      $sth = $this->db->prepare("SELECT * FROM tbl_promo_resto WHERE id_places_resto = :resto_id ORDER BY id_places_resto");
      $sth->execute(array(
        'resto_id' => $input['resto_id']        
        ));      
      $mall = $sth->fetchAll(); 
   
    return $this->response->withJson(array('status'=>'true','data'=>$mall));        
});






//functions

function passhash($passwd){
$options = [
    'cost' => 12    
];
 return password_hash($passwd, PASSWORD_BCRYPT, $options);
}

function login($password,$hashed){ 
    if(password_verify($password,$hashed)){
      return 1;
    }else{
      return 0;
    }
}

