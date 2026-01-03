<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <%-- Pagination Component Required attributes: currentPage, totalPages, baseUrl --%>

            <c:if test="${totalPages > 1}">
                <%-- Tính startPage và endPage --%>
                    <c:set var="startPage" value="${currentPage - 2}" />
                    <c:if test="${startPage < 1}">
                        <c:set var="startPage" value="1" />
                    </c:if>

                    <c:set var="endPage" value="${currentPage + 2}" />
                    <c:if test="${endPage > totalPages}">
                        <c:set var="endPage" value="${totalPages}" />
                    </c:if>

                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center mb-0">
                            <%-- First Page --%>
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="${baseUrl}${baseUrl.contains('?') ? '&' : '?'}page=1"
                                        title="Trang đầu">
                                        <i class="bi bi-chevron-double-left"></i>
                                    </a>
                                </li>

                                <%-- Previous Page --%>
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link"
                                            href="${baseUrl}${baseUrl.contains('?') ? '&' : '?'}page=${currentPage - 1}"
                                            title="Trang trước">
                                            <i class="bi bi-chevron-left"></i>
                                        </a>
                                    </li>

                                    <%-- Page Numbers --%>
                                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                <a class="page-link"
                                                    href="${baseUrl}${baseUrl.contains('?') ? '&' : '?'}page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>

                                        <%-- Next Page --%>
                                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                <a class="page-link"
                                                    href="${baseUrl}${baseUrl.contains('?') ? '&' : '?'}page=${currentPage + 1}"
                                                    title="Trang sau">
                                                    <i class="bi bi-chevron-right"></i>
                                                </a>
                                            </li>

                                            <%-- Last Page --%>
                                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                    <a class="page-link"
                                                        href="${baseUrl}${baseUrl.contains('?') ? '&' : '?'}page=${totalPages}"
                                                        title="Trang cuối">
                                                        <i class="bi bi-chevron-double-right"></i>
                                                    </a>
                                                </li>
                        </ul>
                    </nav>

                    <div class="text-center text-muted small mt-2">
                        Trang ${currentPage} / ${totalPages}
                    </div>
            </c:if>