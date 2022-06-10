<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">

						<form action="logincontroller" method="post">
								<!-- name için input -->
								<div class="form-group row">
									<label for="name-input"
										class="col-md-4 col-form-label text-md-right"> Name </label>
									<div class="col-md-6">
										<input type="text" id="name-input" class="form-control"
											name="name" required autofocus>
									</div>
								</div>

								<!-- password için input -->
								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right"> Password
									</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>

								<!-- Buton   -->
								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary" value="login">
										Login</button>
								</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	</form>
</body>
</html>