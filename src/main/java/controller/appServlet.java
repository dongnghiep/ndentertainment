package controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.VideoDAO;
import dao.favoriteDAO;
import entity.Favorite;
import entity.Share;
import entity.User;
import entity.Video;
import entity.countLiked;
import entity.userLiked;
import entity.userShared;
import extensions.jpaUtils;

@MultipartConfig()
@WebServlet({ "/ndentertainment/home/*", "/ndentertainment/account/sign-in", "/ndentertainment/account/sign-up",
		"/ndentertainment/account/sign-out", "/ndentertainment/account/forgot-password",
		"/ndentertainment/account/change-password", "/ndentertainment/account/edit-profile",
		"/ndentertainment/favorite/*", "/ndentertainment/video-detail/*", "/ndentertainment/admin/videos",
		"/ndentertainment/admin/users", "/ndentertainment/admin/report/*", "/ndentertainment/admin/update-user",
		"/ndentertainment/admin/delete-user", "/ndentertainment/admin/edit-user/*",
		"/ndentertainment/admin/edit-video/*", "/ndentertainment/admin/update-video",
		"/ndentertainment/admin/delete-video", "/ndentertainment/admin/create-video", "/ndentertainment/like/*",
		"/ndentertainment/disfavor/*", "/ndentertainment/share/*" })
public class appServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if (uri.contains("sign-in")) {
			req.setAttribute("message", "Login");
			this.doSignIn(req, resp);
		} else if (uri.contains("sign-up")) {
			this.doSignUp(req, resp);
			req.setAttribute("message", "Register");
		} else if (uri.contains("edit-profile")) {
			req.setAttribute("message", "Edit profile");
			this.doEditProfile(req, resp);
		} else if (uri.contains("change-password")) {
			req.setAttribute("message", "Change Password");
			this.doChangePassword(req, resp);
		} else if (uri.contains("forgot-password")) {
			req.setAttribute("message", "Forgot Password");
			this.doForgotPassword(req, resp);
		} else if (uri.contains("home")) {
			this.doHome(req, resp);
		} else if (uri.contains("favorite")) {
			this.doFavorite(req, resp);
		} else if (uri.contains("video-detail")) {
			this.doVideoDetail(req, resp);
		} else if (uri.contains("videos")) {
			this.doVideos(req, resp);
		} else if (uri.contains("edit-video")) {
			this.doEditVideo(req, resp);
		} else if (uri.contains("create-video")) {
			this.doCreateVideo(req, resp);
		} else if (uri.contains("update-video")) {
			this.doUpdateVideo(req, resp);
		} else if (uri.contains("delete-video")) {
			this.doDeleteVideo(req, resp);
		} else if (uri.contains("edit-user")) {
			this.doEditUser(req, resp);
		} else if (uri.contains("update-user")) {
			this.doUpdateUser(req, resp);
		} else if (uri.contains("delete-user")) {
			this.doDeleteUser(req, resp);
		} else if (uri.contains("users")) {
			this.doUsers(req, resp);
		} else if (uri.contains("report/video-liked")) {
			this.doReport1(req, resp);
		} else if (uri.contains("report/user-liked")) {
			this.doReport2(req, resp);
		} else if (uri.contains("report/user-shared")) {
			this.doReport3(req, resp);
		} else if (uri.contains("like")) {
			this.doLike(req, resp);
		} else if (uri.contains("disfavor")) {
			this.doUnLike(req, resp);
		} else if (uri.contains("share")) {
			this.doShare(req, resp);
		} else {
			this.doSignOut(req, resp);
		}
	}

	private void doDeleteVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		if (id != null) {
			VideoDAO vdao = new VideoDAO();
			vdao.delete(id);
			doVideos(req, resp);
		}
	}

	private void doUpdateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Video video = new Video();
			BeanUtils.populate(video, req.getParameterMap());
			VideoDAO vdao = new VideoDAO();
			vdao.update(video);
			resp.setHeader("Refresh", "0; URL=http://your-current-page");
			doVideos(req, resp);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doCreateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			VideoDAO vdao = new VideoDAO();
			vdao.create(video);
			doVideos(req, resp);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doEditVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageVideos", "active");
		VideoDAO vdao = new VideoDAO();
		List<Video> countVideo = vdao.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) 5);
		req.setAttribute("maxPage", maxPage);
		List<Video> list;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null) {
			list = vdao.findAllByPage(1);
			req.setAttribute("currentPage", 1);
		} else {
			list = vdao.findAllByPage(Integer.parseInt(pageNumber));
			req.setAttribute("currentPage", pageNumber);
		}
		req.setAttribute("allVideo", countVideo.size());
		req.setAttribute("list", list);
		String uri = req.getRequestURI();
		VideoDAO udao = new VideoDAO();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		Video video = vdao.findById(id);
		req.setAttribute("video", video);
		req.setAttribute("tabEdit", "active");
		req.setAttribute("showEdit", "show active");
		req.setAttribute("tabList", "");
		req.setAttribute("showList", "");
		req.getRequestDispatcher("/views/videosManagement.jsp").forward(req, resp);
	}

	private void doDeleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		UserDAO udao = new UserDAO();
		udao.delete(id);
		doUsers(req, resp);
	}

	private void doUpdateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			UserDAO udao = new UserDAO();
			udao.update(user);
			doUsers(req, resp);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doEditUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageUsers", "active");
		String uri = req.getRequestURI();
		UserDAO udao = new UserDAO();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		User user = udao.findById(id);
		req.setAttribute("user", user);
		req.setAttribute("tabEdit", "active");
		req.setAttribute("showEdit", "show active");
		req.setAttribute("tabList", "");
		req.setAttribute("showList", "");
		List<User> countVideo = udao.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) 5);
		req.setAttribute("maxPage", maxPage);
		List<User> list;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null) {
			list = udao.findAllByPage(1);
			req.setAttribute("currentPage", 1);
		} else {
			list = udao.findAllByPage(Integer.parseInt(pageNumber));
			req.setAttribute("currentPage", pageNumber);
		}
		req.setAttribute("allUser", list.size());
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/usersManagement.jsp").forward(req, resp);
	}

	private void doShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		VideoDAO vdao = new VideoDAO();
		String videoid = uri.substring(uri.lastIndexOf("/") + 1);
		Video video = vdao.findById(videoid);
		User user = (User) req.getSession().getAttribute("user");
		String userid = user.getId();
		String email = req.getParameter("emailShare");
		System.out.println(email);
		Date dateShare = new Date();
		Share entity = new Share();
		entity.setUser(user);
		entity.setVideo(video);
		entity.setEmails(email);
		entity.setShareDate(dateShare);
		EntityManager em = jpaUtils.getEntityManager();
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = "vonghiep401@gmail.com";
					String password = "password";
					return new PasswordAuthentication(username, password);

				}
			});
			MimeBodyPart bodypart = new MimeBodyPart();
			MimeMultipart multipart = new MimeMultipart();
			MimeMessage message = new MimeMessage(session);
			String to = email;
			String subject = "Video hay dành cho bạn";
			String content = "Link youtube của video: https://www.youtube.com/watch?v=" + videoid;
			try {
				bodypart.setText(content, "utf-8", "html");
				multipart.addBodyPart(bodypart);
				message.setFrom(new InternetAddress("vonghiep401@gmail.com"));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
				message.setSubject(subject, "utf-8");
				message.setReplyTo(message.getFrom());
				message.setContent(multipart);
				Transport.send(message);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		doVideoDetail(req, resp);
	}

	private void doLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO vdao = new VideoDAO();
		String uri = req.getRequestURI();
		String videoid = uri.substring(uri.lastIndexOf("/") + 1);
		Video video = vdao.findById(videoid);
		User user = (User) req.getSession().getAttribute("user");
		Favorite favorite = new Favorite();
		favorite.setUser(user);
		favorite.setVideo(video);
		favorite.setLikeDate(new Date());
		favoriteDAO fdao = new favoriteDAO();
		fdao.create(favorite);
		doVideoDetail(req, resp);
	}

	private void doUnLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String videoid = uri.substring(uri.lastIndexOf("/") + 1);
		User user = (User) req.getSession().getAttribute("user");
		String userid = user.getId();
		favoriteDAO fdao = new favoriteDAO();
		fdao.delete(videoid, userid);
		doFavorite(req, resp);
	}

	private void doVideoDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		VideoDAO vdao = new VideoDAO();
		Video video = vdao.findById(id);
		req.setAttribute("video", video);
		req.setAttribute("liked", true);
		favoriteDAO fdao = new favoriteDAO();
		User user = (User) req.getSession().getAttribute("user");
		if(user != null) {
			String userid = user.getId();
			List<Favorite> list = fdao.findByUserid(userid);
			req.setAttribute("liked", true);
			for (Favorite f : list) {
				if (f.getVideo().getId().equals(id)) {
					req.setAttribute("liked", false);
					break;
				}
			}
		}
		
		List<Video> list1 = vdao.findAllActive();
		req.setAttribute("list", list1);
		req.getRequestDispatcher("/views/videoDetails.jsp").forward(req, resp);
	}

	private void doReport1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageReport", "active");
		req.setAttribute("tab1Active", "active");
		req.setAttribute("show1", "show active");
		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "select new countLiked(o.video.title, count(o), max(o.likeDate), min(o.likeDate))"
				+ " from Favorite o group by o.video.title";
		TypedQuery<countLiked> query = em.createQuery(jpql, countLiked.class);
		List<countLiked> list = query.getResultList();
		req.setAttribute("list1", list);
		req.getRequestDispatcher("/views/report.jsp").forward(req, resp);
	}

	private void doReport2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageReport", "active");
		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "select new userLiked(o.user.id, o.user.fullname, o.user.email, o.likeDate)"
				+ " from Favorite o where o.video.title like :title";
		String title = req.getParameter("videoTitle");
		TypedQuery<userLiked> query = em.createQuery(jpql, userLiked.class);
		query.setParameter("title", "%" + title + "%");
		List<userLiked> list = query.getResultList();
		req.setAttribute("list2", list);
		req.setAttribute("videoTitle", title);
		req.setAttribute("tab2Active", "active");
		req.setAttribute("show2", "show active");
		req.getRequestDispatcher("/views/report.jsp").forward(req, resp);
	}

	private void doReport3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageReport", "active");
		EntityManager em = jpaUtils.getEntityManager();
		String jpql = "select new userShared(o.user.fullname, o.user.email, o.emails, o.shareDate)"
				+ " from Share o where o.video.title like :title";
		String title = req.getParameter("videoTitle");
		TypedQuery<userShared> query = em.createQuery(jpql, userShared.class);
		query.setParameter("title", "%" + title + "%");
		List<userShared> list = query.getResultList();
		req.setAttribute("list3", list);
		req.setAttribute("videoTitle", title);
		req.setAttribute("tab3Active", "active");
		req.setAttribute("show3", "show active");
		req.getRequestDispatcher("/views/report.jsp").forward(req, resp);
	}

	private void doUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageUsers", "active");
		req.setAttribute("tabList", "active");
		req.setAttribute("showList", "show active");
		req.setAttribute("tabEdit", "");
		req.setAttribute("showEdit", "");
		UserDAO udao = new UserDAO();
		List<User> countVideo = udao.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) 5);
		req.setAttribute("maxPage", maxPage);
		List<User> list;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null) {
			list = udao.findAllByPage(1);
			req.setAttribute("currentPage", 1);
		} else {
			list = udao.findAllByPage(Integer.parseInt(pageNumber));
			req.setAttribute("currentPage", pageNumber);
		}
		req.setAttribute("allUser", list.size());
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/usersManagement.jsp").forward(req, resp);

	}

	private void doVideos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageVideos", "active");
		VideoDAO vdao = new VideoDAO();
		List<Video> countVideo = vdao.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) 6);
		req.setAttribute("maxPage", maxPage);
		List<Video> list;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null) {
			list = vdao.findAllByPage(1);
			req.setAttribute("currentPage", 1);
		} else {
			list = vdao.findAllByPage(Integer.parseInt(pageNumber));
			req.setAttribute("currentPage", pageNumber);
		}
		req.setAttribute("allVideo", countVideo.size());
		req.setAttribute("list", list);
		req.setAttribute("tabList", "active");
		req.setAttribute("showList", "show active");
		req.setAttribute("tabEdit", "");
		req.setAttribute("showEdit", "");
		req.getRequestDispatcher("/views/videosManagement.jsp").forward(req, resp);
	}

	private void doFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageFavorite", "active");
		User user = (User) req.getSession().getAttribute("user");
		String id = user.getId();
		EntityManager em = jpaUtils.getEntityManager();
		TypedQuery<Video> query = em.createNamedQuery("Video.favoriteByUser", Video.class);
		query.setParameter("uid", id);
		List<Video> list = query.getResultList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/favoriteVideo.jsp").forward(req, resp);
	}

	private void doHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("pageHome", "active");
		VideoDAO vdao = new VideoDAO();
		List<Video> countVideo = vdao.findAllActive();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) 6);
		req.setAttribute("maxPage", maxPage);
		List<Video> list;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null) {
			list = vdao.findAllByPageActive(1);
			req.setAttribute("currentPage", 1);
		} else {
			list = vdao.findAllByPageActive(Integer.parseInt(pageNumber));
			req.setAttribute("currentPage", pageNumber);
		}
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			try {
				UserDAO dao = new UserDAO();
				User user = dao.findById(id);
				if (!user.getPassword().equals(pw)) {
					req.setAttribute("message", "Sai mật khẩu!");
				} else {
					req.setAttribute("message", "Đăng nhập thành công!");
					req.getSession().setAttribute("user", user);
				}
			} catch (Exception e) {
				req.setAttribute("message", "Sai tên đăng nhập!");
			}
		}
		doHome(req, resp);
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				User entity = new User();
				BeanUtils.populate(entity, req.getParameterMap());
				UserDAO dao = new UserDAO();
				dao.create(entity);
				req.setAttribute("message", "Đăng ký thành công!");
			} catch (Exception e) {
				req.setAttribute("message", "Lỗi đăng ký!");
			}
		}
		req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
	}

	private void doEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				UserDAO dao = new UserDAO();
				dao.update(user);
				req.setAttribute("message", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				req.setAttribute("message", "Lỗi cập nhật tài khoản!");
			}
		}
		req.getRequestDispatcher("/views/editProfile.jsp").forward(req, resp);
	}

	private void doChangePassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		req.setAttribute("id", user.getId());
		String id = req.getParameter("id");
		String curentPassword = req.getParameter("curentPass");
		String newPassword = req.getParameter("newPass");
		String confirmPassword = req.getParameter("confirmPass");
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				if (!curentPassword.equals(user.getPassword())) {
					req.setAttribute("message", "Sai mật khẩu hiện tại!");
				} else if (!confirmPassword.equals(newPassword)) {
					req.setAttribute("message", "Mật khẩu xác nhận không trùng khớp!");
				} else {
					UserDAO dao = new UserDAO();
					dao.updatePassword(id, newPassword);
					req.setAttribute("message", "Cập nhật mật khẩu thành công!");
				}
			} catch (Exception e) {
				req.setAttribute("message", "Lỗi cập nhật mật khẩu!");
			}
		}
		req.getRequestDispatcher("/views/changePassword.jsp").forward(req, resp);
	}

	private void doForgotPassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		UserDAO dao = new UserDAO();
		User user = dao.findById(id);
		String email = req.getParameter("email");
		if (!email.equals(user.getEmail())) {
			req.setAttribute("message", "Sai địa chỉ email!");
		} else {
			String method = req.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String username = "vonghiep401@gmail.com";
						String password = "hqmiavmzejvcmifr";
						return new PasswordAuthentication(username, password);

					}
				});
				MimeBodyPart bodypart = new MimeBodyPart();
				MimeMultipart multipart = new MimeMultipart();
				MimeMessage message = new MimeMessage(session);
				String to = user.getEmail();
				String subject = "Lấy lại mật khẩu";
				String content = "Mật khẩu hiện tại của bạn là: " + user.getPassword();
				try {
					bodypart.setText(content, "utf-8", "html");
					multipart.addBodyPart(bodypart);
					message.setFrom(new InternetAddress("vonghiep401@gmail.com"));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
					message.setSubject(subject, "utf-8");
					message.setReplyTo(message.getFrom());
					message.setContent(multipart);
					Transport.send(message);
					req.setAttribute("message", "Mật khẩu hiện tại đã được gửi vào email của bạn!");
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		req.getRequestDispatcher("/views/forgotPassword.jsp").forward(req, resp);
	}

	private void doSignOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}
}
