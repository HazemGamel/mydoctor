headersWithToken(String token) => {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

authHeader() => {
      'Content-Type': 'application/json',
    };
