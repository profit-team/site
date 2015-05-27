<?php

namespace ProfitTeamSiteBundle\Controller;

use Knp\RadBundle\Controller\Controller;

class DefaultController extends Controller
{
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function welcomeAction()
    {
        return $this->render('SiteBundle:Default:welcome.html.twig', []);
    }
}
