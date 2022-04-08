const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const driversPageDisplayName = "Enquiries";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "Staff";
const clientsPageRoute = "/clients";
const editProfilePageDisplayName = "Edit-profile";
const editProfileRoute = "/edit-profile";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

const viewEnquiryDetails = "/view-enquiry";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(driversPageDisplayName, driversPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(editProfilePageDisplayName, editProfileRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
