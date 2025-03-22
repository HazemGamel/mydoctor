headersWithToken(String token) => {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

authHeader() => {
      'Content-Type': 'application/json',
    };

headersWithTokenforimage(String token) => {
      'Authorization': 'Bearer $token',
      "Content-Type":
          'multipart/form-data; boundary=<calculated when request is sent>',
    };
