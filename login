  protected function validateLogin(Request $request)
 {
 $g_recaptcha_response = $request->post('g-recaptcha-response');
 $g_recaptcha_secret = env('GOOGLE_RECAPTCHA_SECRET');

 if(!GoogleRecaptcha::verify($g_recaptcha_secret,'Google Recaptcha Validation 
 Failed!!',0.5,$g_recaptcha_response)){

return Redirect::back();

 }else{

 $request->validate([
    $this->username() => 'required|string',
    'password' => 'required|string',
  ]);
 }
 }
