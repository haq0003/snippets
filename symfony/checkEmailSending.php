<?php

    /**
     * @Route("/XXXXXXftJgft", name="testSendEmail")
     */
    public function testEmailAction(Request $request)
    {
        // remove comments before deploy to preprod
        $message = \Swift_Message::newInstance()
            ->setSubject('Formulaire de contact')
            ->setFrom("XXXX@XXXXX.com")
            ->setTo('test-XXXXXX@mail-tester.com')
            ->setContentType("text/html")
            ->setBody("Message Nunc vero inanes flatus quorundam vile esse quicquid extra");

        $mailLogger = new \Swift_Plugins_Loggers_ArrayLogger();

        $transport = $this->container->get('swiftmailer.mailer.default.transport.real');

        dump($transport);

        /**
         * Check with dump($transport)  that you are using good configuration transport
         */

        $mailer = \Swift_Mailer::newInstance($transport);

        $mailer->registerPlugin(new \Swift_Plugins_LoggerPlugin($mailLogger));

        if ($result = $mailer->send($message)) {
            $this->json(['ok' . print_r($result, true)]);
        } else {
            $message = $mailLogger->dump();
            dump($message);
            $this->json(['ko']);
        }
        exit;
    }
