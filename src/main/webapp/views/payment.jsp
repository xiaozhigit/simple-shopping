<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
%>
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
	<title>Confirm Order</title>
	<link rel="stylesheet" href="<%=path%>/static/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/bootstrap/lightbox.min.css">
	<link rel="stylesheet" href="<%=path%>/static/bootstrap/style.css?v=44">
    <link href="<%=path%>/static/bootstrap/alertify/alertify.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/bootstrap/alertify/themes/default.min.css" rel="stylesheet" type="text/css">

	<link rel="apple-touch-icon" sizes="57x57" href="<%=path%>/static/bootstrap/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="<%=path%>/static/bootstrap/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<%=path%>/static/bootstrap/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="<%=path%>/static/bootstrap/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<%=path%>/static/bootstrap/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="<%=path%>/static/bootstrap/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="<%=path%>/static/bootstrap/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="<%=path%>/static/bootstrap/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="<%=path%>/static/bootstrap/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="<%=path%>/static/bootstrap/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="<%=path%>/static/bootstrap/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=path%>/static/bootstrap/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="<%=path%>/static/bootstrap/favicon/favicon-16x16.png">
	<link rel="manifest" href="<%=path%>/static/bootstrap/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="<%=path%>/static/bootstrap/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
</head>

<body>
    <div class="row m-5">
        <!-- Start: Order Summary -->
		<div class="col-12 col-md-12 col-lg-8 mb-5">
			Thanks for your purchase. We received your order.
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Order Summary</h4>
                    <h6 class="text-muted card-subtitle mb-2">Please double-check your order summary before making any payments.</h6>
                    <p class="card-text">Your order summary is listed below. If you think there is a mistake, you can always cancel your order and place a new one.</p>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Single Price</th>
									<th>Quantity</th>
									<th>Sub Total</th>
                                    <th>Tax</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
							<c:forEach var="orderItem" items="${orders.orderItems}"  varStatus="s">
								<tr>
									<td><c:out value="${orderItem.productName}" /></td>
									<td><c:out value="${orderItem.price}" /></td>
									<td><c:out value="${orderItem.quantity}" /></td>
									<td><c:out value="${orderItem.subTotal}" /></td>
									<td><c:out value="${orderItem.totalTax}" /></td>
									<td><c:out value="${orderItem.total}" /></td>
								</tr>
							</c:forEach>

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
                    <h4 class="card-title">Order Informations</h4>
					<h6 class="text-muted card-subtitle mb-2">You can review your order details.</h6>
                    <div class="table-responsive table-borderless">
                        <table class="table table-striped table-bordered table-hover">
                            <tbody>
                                <tr class="table-${orders.orderStatus=="1"?'success':'warning'}">
                                    <td>Order Status</td>
                                    <td>${orders.orderStatus=="1"?"PAID":"Unpaid"}</td>
								</tr>
                                <tr>
                                    <td>Order Time</td>
                                    <td>${orders.createTime}</td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td>${orders.name}</td>
                                </tr>
                                <tr>
                                    <td>E-Mail</td>
                                    <td>${orders.email}</td>
                                </tr>
                                <tr>
                                    <td>Company</td>
                                    <td>${orders.company}</td>
                                </tr>
                                <tr>
                                    <td>Phone</td>
                                    <td>${orders.phone}</td>
								</tr>
<%--								<repeat group="{{@CUSTOM_FIELDS}}" key="{{@CKEY}}" value="{{@CVALUE}}">--%>
<%--									<tr>--%>
<%--										<td>{{@CKEY}}</td>--%>
<%--										<td>{{@CVALUE}}</td>--%>
<%--									</tr>--%>
<%--								</repeat>--%>
                                <tr class="table-secondary">
                                    <td>Total Tax</td>
                                    <td>${orders.taxes}</td>
                                </tr>
                                <tr class="table-primary">
                                    <td>Order Total</td>
                                    <td>${orders.total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
			<!-- End: Order Info -->
			<check if="${orders.orderStatus=="0"}">
				<!-- Start: Payment Card -->
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="card-title">{{@LANG_50| raw}}</h4>
						<h6 class="text-muted card-subtitle mb-2">{{@LANG_51| raw}}</h6>
						<p class="card-text">{{@LANG_52| raw}}</p>
						<form action="/charge" method="post" id="payment-form">
							<input type="hidden" name="orderId" value="{{@ORDER.id}}">
							<input type="hidden" name="orderHash" value="{{@ORDER.hash}}">
							<form id="payment-form">
								<div id="card-element">
								</div>
							
								<div id="card-errors" role="alert"></div>
						
							<button class="mt-3 btn btn-block btn-success btn-sm">Submit Order</button>
						</form>
					</div>
				</div>
				<!-- End: Payment Card -->
			</check>

			<check if="${orders.orderStatus == '0'}">
				<!-- Start: Cancel order -->
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="card-title">Cancel Your Order</h4>
						<h6 class="text-muted card-subtitle mb-2">You can cancel your order with the button below.</h6>
						<p class="card-text">If you think there is a mistake on your order, or you just don't want to order anymore, just click the button below to cancel your order. No need to contact with us! Click and your order will be cancelled.
						<br>
							<strong>Please be aware that this action CAN NOT be reversed, once you cancel your order you cannot see it again.</strong>
						</p>
						<button class="btn btn-danger btn-block" onclick="cancelConfirm('<%=path%>/cancel/${orders.id}');">Cancel Order</button>
					</div>
				</div>
				<!-- End: Cancel order -->
			</check>
        </div>
        <!-- End: Payment Area -->
    </div>
	<script src="<%=path%>/static/bootstrap/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/static/bootstrap/alertify.min.js"></script>
	<script src="<%=path%>/static/bootstrap/bootstrap.min.js"></script>
	<script>
		var clientSecret = '{{@clientSecret}}'
	</script>
	<script>
		function cancelConfirm(link) {
			alertify.confirm("Cancel Confirm?", "Click OK if you want to cancel this order.",
				function () {
					window.location.href = link;
				},
				function () {
					alertify.error('error');
				});

		}
	</script>
	<check if="${orders.orderStatus == '0'}">
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
							name: '${orders.name}',
							phone: '${orders.phone}',
							email: '${orders.email}'
						}
					}
				}).then(function (result) {
					if (result.error) {
						// Show error to your customer (e.g., insufficient funds)
						alertify.error(result.error.message);
					} else {
						// The payment has been processed!
						if (result.paymentIntent.status === 'succeeded') {
							alertify.success("pay succeeded");
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