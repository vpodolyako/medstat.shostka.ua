<?php

interface IAuthenticationContext
{
    public function authenticateRequest(RequestOptions $request);
}