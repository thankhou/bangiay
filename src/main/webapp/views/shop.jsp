<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="/common/cssFile.jsp"%>

</head>
<body>

	<div class="site-wrap">
		<%@include file="/common/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Shop</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-9 order-2">

						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Shop All</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Brand</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="/shop.html/searchBrand?brand=Adidas">Adidas</a>
											<a class="dropdown-item" href="/shop.html/searchBrand?brand=MLB">MLB</a>
											<a class="dropdown-item" href="/shop.html/searchBrand?brand=Nike">Nike</a>
										</div>
									</div>
									<div class="btn-group">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="/shop.html/sort1?asc=name">Name,
												A to Z</a> <a class="dropdown-item" href="/shop.html/sort?desc=name">Name,
												Z to A</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="/shop.html/sort1?asc=price">Price,
												low to high</a> <a class="dropdown-item"
												href="/shop.html/sort?desc=price">Price, high to low</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5">

							<c:forEach var="item" items="${products.content}">
								<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
									<div class="block-4 text-center border">
										<figure class="block-4-image">
											<a href="/shop-single.html/${item.id}"><img
												src="../../images/${item.image}" alt="Image placeholder"
												class="img-fluid"></a>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a href="/shop-single.html/${item.id}">${item.category.name}</a>
											</h3>
											<p class="mb-0">${item.name}</p>
											<p class="text-primary font-weight-bold">$ ${item.price}</p>
											<a href="/cart.html/add/${item.id}">Add to cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
                  <!-- ĐIỀU HƯỚNG -->
									<c:choose>
										<c:when test="${not empty check}">
											<ul>
												<li><a href="/shop.html/search?p=0">&lt;</a></li>
												<c:forEach varStatus="i" begin="1"
													end="${products.totalPages}">
													<li><a href="/shop.html/search?p=${i.index-1}">${i.index}</a></li>
												</c:forEach>
												<li><a
													href="/shop.html/search?p=${products.totalPages - 1}">&gt;</a></li>
											</ul>
										</c:when>
										
										<c:when test="${not empty check1}">
                      <ul>
                        <li><a href="/shop.html/findByPrice?p=0">&lt;</a></li>
                        <c:forEach varStatus="i" begin="1"
                          end="${products.totalPages}">
                          <li><a href="/shop.html/findByPrice?p=${i.index-1}">${i.index}</a></li>
                        </c:forEach>
                        <li><a
                          href="/shop.html/findByPrice?p=${products.totalPages - 1}">&gt;</a></li>
                      </ul>
                    </c:when>
                    
                    <c:when test="${not empty check2}">
                      <ul>
                        <li><a href="/shop.html/searchBrand?p=0">&lt;</a></li>
                        <c:forEach varStatus="i" begin="1"
                          end="${products.totalPages}">
                          <li><a href="/shop.html/searchBrand?p=${i.index-1}">${i.index}</a></li>
                        </c:forEach>
                        <li><a
                          href="/shop.html/searchBrand?p=${products.totalPages - 1}">&gt;</a></li>
                      </ul>
                    </c:when>
                    
                    <c:when test="${not empty check3}">
                      <ul>
                        <li><a href="/shop.html/sort?p=0">&lt;</a></li>
                        <c:forEach varStatus="i" begin="1"
                          end="${products.totalPages}">
                          <li><a href="/shop.html/sort?p=${i.index-1}">${i.index}</a></li>
                        </c:forEach>
                        <li><a
                          href="/shop.html/sort?p=${products.totalPages - 1}">&gt;</a></li>
                      </ul>
                    </c:when>
                    
                    <c:when test="${not empty check4}">
                      <ul>
                        <li><a href="/shop.html/sort1?p=0">&lt;</a></li>
                        <c:forEach varStatus="i" begin="1"
                          end="${products.totalPages}">
                          <li><a href="/shop.html/sort1?p=${i.index-1}">${i.index}</a></li>
                        </c:forEach>
                        <li><a
                          href="/shop.html/sort1?p=${products.totalPages - 1}">&gt;</a></li>
                      </ul>
                    </c:when>
                    
										<c:otherwise>
											<ul>
												<li><a href="/shop.html?p=0">&lt;</a></li>
												<c:forEach varStatus="i" begin="1"
													end="${products.totalPages}">
													<li><a href="/shop.html?p=${i.index-1}">${i.index}</a></li>
												</c:forEach>
												<li><a href="/shop.html?p=${products.totalPages - 1}">&gt;</a></li>
											</ul>
										</c:otherwise>
									</c:choose>



								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1"><a href="/shop.html?brand=Adidas"
									class="d-flex"><span>Adidas</span> <span
										class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="/shop.html?brand=MLB"
									class="d-flex"><span>MLB</span> <span
										class="text-black ml-auto">(2,550)</span></a></li>
								<li class="mb-1"><a href="/shop.html?brand=Nike"
									class="d-flex"><span>Nike</span> <span
										class="text-black ml-auto">(2,124)</span></a></li>
							</ul>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Filter
									by Price</h3>
								<form action="/shop.html/findByPrice" method="get">
									<div class="row justify-content-center">
										<div class="col">
											<div class="input-group">

												<input type="text" class="form-control rounded" name="min"
													value="${param.min}" placeholder="Giá thấp">
											</div>
										</div>
										<div>
											<span class="h4">-</span>
										</div>
										<div class="col">
											<div class="input-group">
												<input type="text" class="form-control rounded" name="max"
													value="${param.max}" placeholder="Giá cao">
											</div>
										</div>
										<div class="col-auto mt-2 ">
											<button type="submit" class="btn btn-warning"
												style="height: 30px; width: 210px">
												<i class="bi bi-search"></i> Tìm kiếm
											</button>
										</div>
									</div>
								</form>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
								<label for="s_sm" class="d-flex"> <input type="checkbox"
									id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small
										(2,319)</span>
								</label> <label for="s_md" class="d-flex"> <input
									type="checkbox" id="s_md" class="mr-2 mt-1"> <span
									class="text-black">Medium (1,282)</span>
								</label> <label for="s_lg" class="d-flex"> <input
									type="checkbox" id="s_lg" class="mr-2 mt-1"> <span
									class="text-black">Large (1,392)</span>
								</label>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
								<a href="/shop.html/Red"
									class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Red (2,429)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Green (2,298)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Blue (1,075)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-primary color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Purple (1,075)</span>
								</a>
							</div>

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="site-section site-blocks-2">
							<div class="row justify-content-center text-center mb-5">
								<div class="col-md-7 site-section-heading pt-4">
									<h2>Categories</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
									data-aos="fade" data-aos-delay="">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="images/b1.webp" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Women</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="100">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="images/b3.webp" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Children</h3>
										</div>
									</a>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
									data-aos="fade" data-aos-delay="200">
									<a class="block-2-item" href="#">
										<figure class="image">
											<img src="images/b2.webp" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">Collections</span>
											<h3>Men</h3>
										</div>
									</a>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>

		<%@include file="/common/footer.jsp"%>
	</div>

	<%@include file="/common/jsFile.jsp"%>

</body>
</html>