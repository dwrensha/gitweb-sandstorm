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

window.addEventListener("message", messageListener);
var template = "git clone " + window.location.protocol + "//git:$API_TOKEN@$API_HOST\n";
window.parent.postMessage({renderTemplate: {rpcId: "0", template: template}}, "*");

});

