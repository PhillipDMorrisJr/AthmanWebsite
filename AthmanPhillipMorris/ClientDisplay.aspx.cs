using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AthmanPhillipMorris.App_Code;

namespace AthmanPhillipMorris
{
    /// <summary>
    /// Main Page
    /// </summary>
    /// <author>
    /// Phillip Morris
    /// </author>
    /// <version>
    /// Fall 2018
    /// </version>
    /// <seealso cref="System.Web.UI.Page" />
    public partial class Main : System.Web.UI.Page
    {
        private Client selectedClient;
        private ClientList clients = new ClientList();
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ddlClients.DataBind();
            }

            this.lblContactAdded.Text = string.Empty;
            this.selectedClient = this.getSelectedClient();
            this.lblName.Text = this.selectedClient.Name;
            this.lblAddress.Text = this.selectedClient.Address;
            this.lblCity.Text = this.selectedClient.City;
            this.lblState.Text = this.selectedClient.State;
            this.lblZipcode.Text = this.selectedClient.Zipcode;
            this.lblEmail.Text = this.selectedClient.Email;
            this.lblPhone.Text = this.selectedClient.Phone;
        }

        /// <summary>
        /// Called when [changed].
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Onselection_Changed(object sender, EventArgs e)
        {
            HttpContext.Current.Session["Client"] = this.getSelectedClient();

        }

        /// <summary>
        /// Gets the selected client.
        /// </summary>
        /// <returns></returns>
        private Client getSelectedClient()
        {
            DataView clientsTable = (DataView)this.sdsClients.Select(DataSourceSelectArguments.Empty);
            if (clientsTable == null)
            {
                return null;
            }

            clientsTable.RowFilter = $"Name = '{this.ddlClients.SelectedValue}'";
            DataRowView row = clientsTable[0];
            Client selectedClient = new Client();
            selectedClient.Name = row["Name"].ToString();
            selectedClient.Address = row["Address"].ToString();
            selectedClient.City = row["City"].ToString();
            selectedClient.Email = row["Email"].ToString();
            selectedClient.State = row["State"].ToString();
            selectedClient.Phone = row["Phone"].ToString();
            selectedClient.Zipcode = row["ZipCode"].ToString();
            return selectedClient;
        }

        /// <summary>
        /// Handles the Click event of the AddContact control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void AddContact_Click(object sender, EventArgs e)
        {
            this.clients = ClientList.GetClients();
            bool clientAdded = this.clients.AddClient(this.selectedClient);
            HttpContext.Current.Session["Clients"] = this.clients;
            if (clientAdded)
            {
                this.lblContactAdded.Text = "[" + this.selectedClient.Name + "] added";
            }
            else
            {
                this.lblContactAdded.Text = "[" + this.selectedClient.Name + "] has already been added";
            }
            
        }

        /// <summary>
        /// Handles the Click event of the ViewContacts control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void ViewContacts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        protected void submitFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ClientFeedback.aspx");
        }
    }

}