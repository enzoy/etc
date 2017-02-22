data:text/html, <html contenteditable>

//Facebook search
javascript:(function() { location.href="https://www.facebook.com/search/top/?q="+prompt("FB Search:")+"&filters_rp_author=me"; })()

//Large blank spaces
javascript:(function() {ztempstr = ""; for (i=0;i<95;i++) { ztempstr += "\u3000"; console.log(ztempstr); }; copy(ztempstr);})()

//Find DOM classes and set display style (mainly, "none" to remove)
javascript:(function() { var classesToFind = ["classname1", "classname2", "classname3"]; var displayToSet = prompt("display css:"); var loopcnt1 = classesToFind.length; for (var i = 0; i < loopcnt1; i++) { var tofind = document.getElementsByClassName(classesToFind[i]); var loopcnt2 = tofind.length; for (var j = 0; j < loopcnt2; j++) { tofind[j].style.display = displayToSet; }} })()