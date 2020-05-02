<!doctype html>
<html lang="en">
<!--
        Multi Product Order Form v2.7


		Coder	: Evrim Altay KOLUACIK
		Help	: https://support.rimtay.com/
		
        All rights are reserved
        Purchase The Script And Start Using Today: https://git.rimtay.com/index.php?id=11
-->

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>{{@SITE_NAME}}</title>
	<link rel="stylesheet" href="{{@SITE.url}}/static/bootstrap.min.css">
	<link rel="stylesheet" href="{{@SITE.url}}/static/lightbox.min.css">
	<link rel="stylesheet" href="{{@SITE.url}}/static/style.css?v=44">
    <link href="{{@SITE.url}}/static/alertify/alertify.min.css" rel="stylesheet" type="text/css">
    <link href="{{@SITE.url}}/static/alertify/themes/default.min.css" rel="stylesheet" type="text/css">

	<link rel="apple-touch-icon" sizes="57x57" href="{{@SITE.url}}/static/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="{{@SITE.url}}/static/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="{{@SITE.url}}/static/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="{{@SITE.url}}/static/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="{{@SITE.url}}/static/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="{{@SITE.url}}/static/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="{{@SITE.url}}/static/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="{{@SITE.url}}/static/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="{{@SITE.url}}/static/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="{{@SITE.url}}/static/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="{{@SITE.url}}/static/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="{{@SITE.url}}/static/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="{{@SITE.url}}/static/favicon/favicon-16x16.png">
	<link rel="manifest" href="{{@SITE.url}}/static/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="{{@SITE.url}}/static/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	{{@PLUGIN_CSS | raw}}
</head>

<body>
	{{@PLUGIN.BODY_TOP_PAYMENT | raw}}
    <div class="row m-5">
        <!-- Start: Order Summary -->
		<div class="col-12 col-md-12 col-lg-8 mb-5">
			{{@MESSAGE | raw}}
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">{{@LANG_47}}</h4>
                    <h6 class="text-muted card-subtitle mb-2">{{@LANG_48}}</h6>
                    <p class="card-text">{{@LANG_49}}</p>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>{{@LANG_12}}</th>
                                    <th>{{@LANG_14}}</th>
									<th>{{@LANG_15}}</th>
									<th>{{@LANG_44}}</th>
                                    <th>{{@LANG_13}}</th>
                                    <th>{{@LANG_16}}</th>
                                </tr>
                            </thead>
                            <tbody>
								<repeat group="{{@ORDERPRODUCTS}}" value="{{@P}}">
									<tr>
										<td>{{@P.name}}<br></td>
										<td>{{@CUR_LEFT}}{{@P.price}}{{@CUR_RIGHT}}</td>
										<td>{{@P.quantity}}</td>
										<td>{{@CUR_LEFT}}{{@P.sub_total}}{{@CUR_RIGHT}}</td>
										<td>{{@CUR_LEFT}}{{@P.total_tax}}{{@CUR_RIGHT}}</td>
										<td>{{@CUR_LEFT}}{{@P.total}}{{@CUR_RIGHT}}</td>
									</tr>
								</repeat>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: Order Summary -->
        <!-- Start: Payment Area -->
		<div class="col-12 col-md-12 col-lg-4">
            <!-- Start: Order Info -->
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">{{@LANG_18}}</h4>
					<h6 class="text-muted card-subtitle mb-2">{{@LANG_74}}</h6>
					{{@PLUGIN.ORDER_DETAILS_INFO | raw}}
                    <div class="table-responsive table-borderless">
                        <table class="table table-striped table-bordered table-hover">
                            <tbody>
                                <tr class="table-{{@ORDER.order_status == 'PAID' ? 'success' : 'warning'}}">
                                    <td>{{@LANG_64}}</td>
                                    <td>{{@ORDER.order_status == 'PAID' ? @LANG_63 : @LANG_62}}</td>
								</tr>
								{{@PLUGIN.ORDER_DETAILS_TOP | raw}}
                                <tr>
                                    <td>{{@LANG_65}}</td>
                                    <td>{{@ORDER.create_time}}</td>
                                </tr>
                                <tr>
                                    <td>{{@LANG_19}}</td>
                                    <td>{{@ORDER.name}}</td>
                                </tr>
                                <tr>
                                    <td>{{@LANG_21}}</td>
                                    <td>{{@ORDER.email}}</td>
                                </tr>
                                <tr>
                                    <td>{{@LANG_23}}</td>
                                    <td>{{@ORDER.company}}</td>
                                </tr>
                                <tr>
                                    <td>{{@LANG_25}}</td>
                                    <td>{{@ORDER.phone}}</td>
								</tr>
								<repeat group="{{@CUSTOM_FIELDS}}" key="{{@CKEY}}" value="{{@CVALUE}}">
									<tr>
										<td>{{@CKEY}}</td>
										<td>{{@CVALUE}}</td>
									</tr>
								</repeat>
								{{@PLUGIN.ORDER_DETAILS_BOTTOM | raw}}
                                <tr class="table-secondary">
                                    <td>{{@LANG_66}}</td>
                                    <td>{{@CUR_LEFT}}{{@ORDER.taxes}}{{@CUR_RIGHT}}</td>
                                </tr>
                                <tr class="table-primary">
                                    <td>{{@LANG_67}}</td>
                                    <td>{{@CUR_LEFT}}{{@ORDER.total}}{{@CUR_RIGHT}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
			<!-- End: Order Info -->
			<check if="{{@PAYMENT_SETTINGS.use_stripe && @ORDER.order_status == 'UNPAID'}}">
				<!-- Start: Payment Card -->
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="card-title">{{@LANG_50| raw}}</h4>
						<h6 class="text-muted card-subtitle mb-2">{{@LANG_51| raw}}</h6>
						<p class="card-text">{{@LANG_52| raw}}</p>
						{{@PLUGIN.PAY_NOW_INFO | raw}}
						<form action="/charge" method="post" id="payment-form">
							<input type="hidden" name="orderId" value="{{@ORDER.id}}">
							<input type="hidden" name="orderHash" value="{{@ORDER.hash}}">
							<form id="payment-form">
								<div id="card-element">
								</div>
							
								<div id="card-errors" role="alert"></div>
						
							<button class="mt-3 btn btn-block btn-success btn-sm">{{@LANG_53}}</button>
						</form>
					</div>
				</div>
				<!-- End: Payment Card -->
			</check>

			<check if="{{@PAYMENT_SETTINGS.enable_cancel && @ORDER.order_status == 'UNPAID'}}">
				<!-- Start: Cancel order -->
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="card-title">{{@LANG_54| raw}}</h4>
						<h6 class="text-muted card-subtitle mb-2">{{@LANG_55| raw}}</h6>
						<p class="card-text">{{@LANG_56 | raw}}</p>
						<button class="btn btn-danger btn-block" onclick="cancelConfirm('{{@SITE.url}}/cancel/{{@ORDER.id}}/{{@CANCEL_HASH}}/{{@CANCEL_TIME}}');">{{@LANG_57}}</button>
						{{@PLUGIN.CANCEL_INFO | raw}}
					</div>
				</div>
				<!-- End: Cancel order -->
			</check>
        </div>
        <!-- End: Payment Area -->
    </div>
	{{@PLUGIN.BODY_BOTTOM_PAYMENT | raw}}
	<script src="{{@SITE.url}}/static/jquery-3.4.1.min.js"></script>
    <script src="{{@SITE.url}}/static/alertify.min.js"></script>
	<script src="{{@SITE.url}}/static/bootstrap.min.js"></script>
	{{@PLUGIN_JS | raw}}
	<script>
		var clientSecret = '{{@clientSecret}}'
	</script>
	<script>
		function cancelConfirm(link) {
			alertify.confirm("{{@LANG_58}}", "{{@LANG_59}}",
				function () {
					window.location.href = link;
				},
				function () {
					alertify.error('{{@LANG_60}}');
				});

		}
	</script>
	<check if="{{@PAYMENT_SETTINGS.use_stripe && @ORDER.order_status == 'UNPAID'}}">
		<script src="https://js.stripe.com/v3/"></script>
		<script>
			var stripe = Stripe('{{@PAYMENT_SETTINGS.stripe_pkey}}');
			var elements = stripe.elements();

			// Set up Stripe.js and Elements to use in checkout form
			var style = {
				base: {
					color: '#2980b9',
					fontSize: '22px',
					fontFamily: '"Open Sans", sans-serif',
					fontSmoothing: 'antialiased',
					'::placeholder': {
						color: '#2c3e50',
					},
				},
				invalid: {
					color: '#c0392b',
					':focus': {
						color: '#303238',
					},
				},
			};
			var card = elements.create('card', {style: style});

			// Add an instance of the card Element into the `card-element` <div>.
			card.mount('#card-element');

			card.addEventListener('change', ({ error }) => {
				const displayError = document.getElementById('card-errors');
				if (error) {
					displayError.textContent = error.message;
				} else {
					displayError.textContent = '';
				}
			});

			var form = document.getElementById('payment-form');

			form.addEventListener('submit', function (ev) {
				ev.preventDefault();
				stripe.confirmCardPayment(clientSecret, {
					payment_method: {
						card: card,
						billing_details: {
							name: '{{@ORDER.name}}',
							phone: '{{@ORDER.phone}}',
							email: '{{@ORDER.email}}'
						}
					}
				}).then(function (result) {
					if (result.error) {
						// Show error to your customer (e.g., insufficient funds)
						alertify.error(result.error.message);
					} else {
						// The payment has been processed!
						if (result.paymentIntent.status === 'succeeded') {
							alertify.success("{{@LANG_61}}");
							// give a chance to webhook so it can update order status.
							setTimeout(function(){
								location.reload();
							}, 3000);
						}
					}
				});
			});

		</script>
	</check>
	</body>

</html>