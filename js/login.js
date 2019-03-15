
/* Sets local storage to assess if user is parent or child*/
export default {
    login(user, pwd, cb) {
      cb = arguments[arguments.length - 1];
      if (localStorage.token) {
        if (cb) cb(true);
        this.onChange(true);
        return;
      }
      pretendRequest(user, pwd, res => {
        if (res.authenticated) {
          localStorage.token = res.token;
          if (cb) cb(true);
          this.onChange(true);
        } else {
          if (cb) cb(false);
          this.onChange(false);
        }
      });
    },

    onChange() {}
  };

  function pretendRequest(user, pwd, cb) {
    setTimeout(() => {
      if (user && pwd) {
        cb({
          authenticated: true,
          token: Math.random()
            .toString(36)
            .substring(7)
        });
      } else {
        cb({ authenticated: false });
      }
    }, 0);
  }