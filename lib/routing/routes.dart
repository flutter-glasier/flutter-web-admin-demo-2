const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const enquiryPageDisplayName = "Enquiries";
const enquiryPageRoute = "/enquiries";

const clientsPageDisplayName = "Staff";
const clientsPageRoute = "/clients";
const editProfilePageDisplayName = "Edit-profile";
const editProfileRoute = "/edit-profile";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

const chatPageDisplayName = "Chat";
const chatPageRoute = "/chat";

const viewEnquiryDetails = "/enquiries/:view-enquiry";
const successScreen = "/success-screen";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(enquiryPageDisplayName, enquiryPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(chatPageDisplayName, chatPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
