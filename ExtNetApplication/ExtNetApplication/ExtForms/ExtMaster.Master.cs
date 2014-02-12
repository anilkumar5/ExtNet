using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace ExtNetApplication.ExtForms
{
    public partial class ExtMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteMapNode siteNode = SiteMap.RootNode;
            Node root = this.CreateNode(siteNode);
            TreePanel1.Root.Add(root);

            //dynamic tree root
        }

        //page tree node loader handler
        protected void LoadPages(object sender, NodeLoadEventArgs e)
        {
            if (!string.IsNullOrEmpty(e.NodeID))
            {
                SiteMapNode siteMapNode = SiteMap.Provider.FindSiteMapNodeFromKey(e.NodeID);

                SiteMapNodeCollection children = siteMapNode.ChildNodes;

                if (children != null && children.Count > 0)
                {
                    foreach (SiteMapNode mapNode in siteMapNode.ChildNodes)
                    {
                        e.Nodes.Add(this.CreateNodeWithOutChildren(mapNode));
                    }
                }
            }
        }

        //dynamic node creation
        private Node CreateNodeWithOutChildren(SiteMapNode siteMapNode)
        {
            Node treeNode;

            if (siteMapNode.ChildNodes != null && siteMapNode.ChildNodes.Count > 0)
            {
                treeNode = new Node();
            }
            else
            {
                treeNode = new Node();
                treeNode.Leaf = true;
            }

            if (!string.IsNullOrEmpty(siteMapNode.Url))
            {
                treeNode.Href = this.Page.ResolveUrl(siteMapNode.Url);
            }

            treeNode.NodeID = siteMapNode.Key;
            treeNode.Text = siteMapNode.Title;
            treeNode.Qtip = siteMapNode.Description;

            return treeNode;
        }

        //static node creation with children
        private Node CreateNode(SiteMapNode siteMapNode)
        {
            Node treeNode = new Node();

            if (!string.IsNullOrEmpty(siteMapNode.Url))
            {
                treeNode.Href = this.Page.ResolveUrl(siteMapNode.Url);
            }

            treeNode.NodeID = siteMapNode.Key;
            treeNode.Text = siteMapNode.Title;
            treeNode.Qtip = siteMapNode.Description;

            SiteMapNodeCollection children = siteMapNode.ChildNodes;

            if (children != null && children.Count > 0)
            {
                foreach (SiteMapNode mapNode in siteMapNode.ChildNodes)
                {
                    treeNode.Children.Add(this.CreateNode(mapNode));
                }
            }
            else
            {
                treeNode.Leaf = true;
            }

            return treeNode;
        }
    }
}