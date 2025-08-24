"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.exportPdf = exports.createTherapistClientLink = exports.generateWeeklyReport = exports.recommendSkills = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const openai_1 = __importDefault(require("openai"));
admin.initializeApp();
const openai = new openai_1.default();
exports.recommendSkills = functions.https.onCall(async (data, context) => {
    const uid = context.auth?.uid;
    if (!uid)
        throw new functions.https.HttpsError('unauthenticated', 'Login required');
    // TODO: fetch signals and build prompt
    try {
        const response = await openai.chat.completions.create({
            model: 'gpt-4o-mini',
            messages: [
                { role: 'system', content: 'You recommend DBT skills succinctly.' },
                { role: 'user', content: 'placeholder prompt' }
            ],
            temperature: 0.2,
        });
        const content = response.choices[0]?.message?.content ?? '';
        if (!content) {
            throw new Error('Empty model response');
        }
        return { recommendations: content };
    }
    catch (error) {
        throw new functions.https.HttpsError('internal', error?.message ?? 'Failed to generate recommendations');
    }
});
exports.generateWeeklyReport = functions.https.onCall(async (data, context) => {
    // TODO: summarise data and store in reports collection
    return { ok: true };
});
exports.createTherapistClientLink = functions.https.onCall(async (data, context) => {
    // TODO: check consent and create document
    return { ok: true };
});
exports.exportPdf = functions.https.onCall(async (data, context) => {
    // TODO: generate PDF and store in Storage
    return { ok: true };
});
