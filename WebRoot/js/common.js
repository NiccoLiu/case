var GLB = GLB || {};
GLB.isMobile = {
    android : function() {
	    return /Android/i.test(navigator.userAgent);
    },
    blackBerry : function() {
	    return /BlackBerry/i.test(navigator.userAgent);
    },
    ios : function() {
	    return /iPhone|iPad|iPod/i.test(navigator.userAgent);
    },
    windows : function() {
	    return /IEMobile/i.test(navigator.userAgent);
    },
    any : function() {
	    return (isMobile.android() || isMobile.blackBerry() || isMobile.ios() || isMobile.windows());
    }
};