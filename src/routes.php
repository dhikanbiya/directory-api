<?php
// Routes
$app->post('/login',function($request,$response){
    $input = $request->getParsedBody();

    if ($this->loginValidation->hasErrors()) { // check for errors with hasErrors
        $data = array();
        return $this->response->withJson(array('status'=>'false','data'=>array($this->loginValidation->getErrors())));
    } else {

      //check email in database
      $st = $this->db->prepare('SELECT * FROM tbl_account WHERE email = :email');
      $st->execute(array(
        'email' => $input['email']      
        ));      
      $count = $st->rowCount();
      $account = $st->fetch();
      if($account >0){      
        $hashed = $account['password'];
        $uid = $account['id'];
        $login = clogin($input['password'],$hashed);
        if($login == 1){
          $st1 = $this->db->prepare('SELECT * FROM tbl_token WHERE id_account = :id_account');
          $st1->execute(array(
            'id_account' => $uid
          ));
          $cLogin = $st1->rowCount();
          if($cLogin>0){ //check user if already login
            return $this->response->withJson(array('status' => 'false','data'=>array('message'=>'already logged in')));
          }else{          
            $token = bin2hex(openssl_random_pseudo_bytes(8));
            $st1 = $this->db->prepare('INSERT INTO tbl_token(id_account,token,device) VALUES (:id_account,:token,:device)');
            $st1->execute(array(
              'id_account' => $uid,
              'token' => $token,
              'device' => $input['device']
            ));
            return $this->response->withJson(array('status' => 'true','data'=>array('message'=>'logged in','token'=>$token)));
          }        
        }else{
          return $this->response->withJson(array('status' => 'false','data'=>array('message'=>'email or password not found')));  
        }
      }else{
        return $this->response->withJson(array('status' => 'false','data'=>array('message'=>'email or password not found')));
      }    


    }

})->add($container->get('loginValidation'));



$app->post('/register', function ($request, $response) {
   if ($this->regValidation->hasErrors()) { // check for errors with hasErrors
        $data = array();
        return $this->response->withJson(array('status'=>'false','data'=>array($this->regValidation->getErrors())));
    } else {
        $input = $request->getParsedBody();   
        $sql = "INSERT INTO tbl_account(username,email,password) VALUES (:username,:email,:password)";
        $sth = $this->db->prepare($sql);
        $sth->execute(array(
            'username' => $input['username'],
            'email' => $input['email'],
            'password' => passhash($input['password'])            
        ));
         return $this->response->withJson(array('status'=>'true'));        
    }
})->add($container->get('regValidation'));


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
});


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

function clogin($password,$hashed){ 
    if(password_verify($password,$hashed)){
      return 1;
    }else{
      return 0;
    }
}

