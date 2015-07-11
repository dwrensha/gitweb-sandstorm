document.addEventListener("DOMContentLoaded", function(event) {
var nodeList = document.querySelectorAll(".projsearch");
if (nodeList.length != 1) {
console.error("expected exactly one node with class '.projsearch'; found " + nodeList.length);
return;
}
nodeList[0].style.display = "none";

var messageListener = function(event) {
  if (event.data.rpcId === "0") {
    if (event.data.error) {
      console.log("ERROR: " + event.data.error);
    } else {
      var el = document.getElementById("offer-iframe");
      el.setAttribute("src", event.data.uri);
    }
  }
};

var username = "any_username";
if (window.crypto) {
  var array = new Uint32Array(8);
  window.crypto.getRandomValues(array);
  username = "";
  for (var ii = 0; ii < array.length; ++ii) {
    username = username + String.fromCharCode(97 + (array[ii] % 26));
  }
}

window.addEventListener("message", messageListener);
var template =
 "Your repo is available at " + window.location.protocol + "//" + username + "@$API_HOST/\n" +
 "protected by the password $API_TOKEN"
window.parent.postMessage({renderTemplate: {rpcId: "0", template: template}}, "*");

});
