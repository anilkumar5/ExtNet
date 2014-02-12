using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace ExtNetApplication
{
    public partial class SearchFilter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SiteMapNode siteNode = SiteMap.RootNode;
            //Node root = this.CreateNode(siteNode);
            //root.AllowDrag = false;
            //root.Expanded = true;
            //TreePanel1.Root.Add(root);
        }

        //static node creation with children
        private Node CreateNode(SiteMapNode siteMapNode)
        {
            Node treeNode = new Node();

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