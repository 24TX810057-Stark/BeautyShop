<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Tin tức - Tuyển dụng</title>
</head>

<body>

	<div class="jobs-container">
		<h2>Current Openings</h2>

		<div class="job-search-box">
			<input type="text" id="jobSearchInput"
				placeholder="Tìm vị trí tuyển dụng..." onkeyup="filterJobs()">
		</div>


		<div class="job-item">
			<div>
				<div class="job-title">[GÒ VẤP] Nhân Viên Thu Ngân - PART TIME</div>
				<div class="job-meta">Thu Ngân (Cashier) · Cửa hàng Gò Vấp ·
					Full-time</div>
				<div class="job-salary">27,000 VND</div>
				<div class="job-deadline">Deadline: 31/01/2026</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('[GÒ VẤP] Nhân Viên Thu Ngân - PART TIME')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">NHÂN VIÊN NAM KIỂM KÊ KHO</div>
				<div class="job-meta">Vận Hành (Packing) · Văn Phòng Lam Thảo
					· Full-time</div>
				<div class="job-salary">6,500,000 – 8,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/12/2025</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('NHÂN VIÊN NAM KIỂM KÊ KHO')">Apply Now
			</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">CONTENT CREATOR</div>
				<div class="job-meta">Marketing · Văn Phòng Lam Thảo ·
					Full-time</div>
				<div class="job-salary">8,000,000 – 12,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/01/2026</div>
			</div>
			<button class="apply-btn" onclick="openModal('CONTENT CREATOR')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">NHÂN VIÊN ĐÓNG HÀNG</div>
				<div class="job-meta">Vận Hành (Packing) · Văn Phòng Lam Thảo
					· Full-time</div>
				<div class="job-salary">6,500,000 – 8,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/01/2026</div>
			</div>
			<button class="apply-btn" onclick="openModal('NHÂN VIÊN ĐÓNG HÀNG')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">[GÒ VẤP] Nhân Viên Tư Vấn - FULLTIME</div>
				<div class="job-meta">Nhân Viên Tư Vấn (Sales) · Cửa Hàng Gò
					Vấp · Full-time</div>
				<div class="job-salary">6,000,000 – 10,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/12/2025</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('[GÒ VẤP] Nhân Viên Tư Vấn - FULLTIME')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">[KV DĨ AN] Nhân Viên Tư Vấn FULL TIME</div>
				<div class="job-meta">Nhân Viên Tư Vấn (Sales) · Cửa Hàng Dĩ
					An, Bình Dương · Full-time</div>
				<div class="job-salary">6,000,000 – 10,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/12/2025</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('[KV DĨ AN] Nhân Viên Tư Vấn FULL TIME')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">[TÂN PHÚ] Nhân Viên Thu Ngân FULL TIME</div>
				<div class="job-meta">Thu Ngân (Cashier) · Cửa Hàng Trần Hưng
					Đạo Quận Tân Phú · Full-time</div>
				<div class="job-salary">6,000,000 – 7,000,000 VND</div>
				<div class="job-deadline">Deadline: 31/01/2026</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('[TÂN PHÚ] Nhân Viên Thu Ngân FULL TIME')">
				Apply Now</button>
		</div>

		<div class="job-item">
			<div>
				<div class="job-title">[TÂN PHÚ] Nhân Viên LIVESTREAM</div>
				<div class="job-meta">Livestream (KOC) · Văn Phòng Lam Thảo ·
					Part-time</div>
				<div class="job-salary">Negotiable</div>
				<div class="job-deadline">Deadline: 31/12/2025</div>
			</div>
			<button class="apply-btn"
				onclick="openModal('[TÂN PHÚ] Nhân Viên LIVESTREAM')">
				Apply Now</button>
		</div>

	</div>

	<!-- APPLY MODAL -->
	<div id="applyModal" class="modal-overlay">
		<div class="modal-box">
			<h3>Ứng tuyển vị trí</h3>

			<form onsubmit="submitForm(event)">
				<div class="form-group">
					<label>Họ và tên</label> <input type="text" required>
				</div>

				<div class="form-group">
					<label>Email</label> <input type="email" required>
				</div>

				<div class="form-group">
					<label>Số điện thoại</label> <input type="tel" required>
				</div>

				<div class="form-group">
					<label>Vị trí ứng tuyển</label> <input type="text" id="jobName"
						readonly>
				</div>

				<div class="form-group">
					<label>Tải lên CV (PDF/DOC)</label> <input type="file"
						accept=".pdf,.doc,.docx" required>
				</div>

				<div class="modal-actions">
					<button type="button" class="btn-cancel" onclick="closeModal()">Hủy</button>
					<button type="submit" class="btn-submit">Gửi hồ sơ</button>
				</div>
			</form>
		</div>
	</div>

	<script>
    const modal = document.getElementById("applyModal");
    const jobInput = document.getElementById("jobName");

    function openModal(jobTitle) {
        jobInput.value = jobTitle;
        modal.style.display = "flex";
    }

    function closeModal() {
        modal.style.display = "none";
    }

    modal.addEventListener("click", function (e) {
        if (e.target === modal) closeModal();
    });

    function submitForm(e) {
        e.preventDefault();
        alert("Gửi hồ sơ thành công!");
        closeModal();
    }
    function filterJobs() {
        const keyword = document
            .getElementById("jobSearchInput")
            .value.toLowerCase();

        const jobs = document.getElementsByClassName("job-item");

        for (let job of jobs) {
            const title = job
                .querySelector(".job-title")
                .innerText
                .toLowerCase();

            job.style.display = title.includes(keyword)
                ? "flex"
                : "none";
        }
    }
</script>

</body>
</html>
