<?php

namespace Mahaelshawardy\MvcCore\Validations;

use Mahaelshawardy\MvcCore\Exceptions\UnsupportedValidationRuleException;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Helpers\ArrayValidator;

class ValidateInputs
{
    private array $inputs = [];
    private array $errors = [];

    public function __construct($inputs)
    {
        $this->inputs = $inputs;
    }

    public function passing_inputs_throw_validation_rules($rules): bool
    {
        $arrayValidator = new ArrayValidator($rules);
        foreach ($rules as $key => $rule) {
            if ($arrayValidator->array_keys_exists($key) !== false) {
                switch ($rule) {
                    case 'required':
                        isset($this->inputs[$key]) && (trim($this->inputs[$key]) !== '') ? $this->inputs[$key] = $this->inputs[$key] : $this->errors[][$key] = Translate::translate('validations', $rule);
                        break;
                    case 'nullable':
                        break;
                    default:
                        throw new UnsupportedValidationRuleException();
                        break;
                }
            }
        }
        return true;
    }

    public function get_errors(): array
    {
        return $this->errors;
    }

    public function get_validated_inputs(): array
    {
        return $this->inputs;
    }
}
