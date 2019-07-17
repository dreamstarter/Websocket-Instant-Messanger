
component output="false" displayname="Application functions" {
  this.name = "wsChat";
  this.applicationTimeout = createTimespan(0, 8, 0, 0);
  this.sessionTimeout = createTimespan(0, 4, 0, 0);
  this.sessionManagement = true;
  this.setClientCookies = false;
  this.scriptProtect = "all";
  this.serialization.preservecaseforstructkey = true;
  // define the websocket Channels with a custom cfcListener
  this.wschannels = [
		{name:"chat"}
	];
  setting showdebugoutput = false;
  
  public boolean function onWSAuthenticate(string username, string password, Struct connectionInfo) {
    // insert code to authenticate the user.
    connectionInfo.username = username;
    return true;
  }
  
  public boolean function onApplicationStart() {
    Application.chatHistory = "";
    return true;
  }  
  
  public void function onRequestEnd() {
    if( StructKeyExists(url, "reset")) {
      ApplicationStop();
      onApplicationStart();
    }
    return;
  }
  
  public any function onError(exception,eventName) {
    writeDump(arguments.exception);
  }
  
}